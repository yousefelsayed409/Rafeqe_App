import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quranapp/core/utils/app_color.dart';
import 'package:quranapp/core/utils/app_styles.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;
bool hasPermission = false;

class _QiblahScreenState extends State<QiblahScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    getPermission();
  }

  Future<void> getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        setState(() {
          hasPermission = true;
        });
      } else {
        final result = await Permission.location.request();
        setState(() {
          hasPermission = (result == PermissionStatus.granted);
        });
      }
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: true,
        //   iconTheme: Theme.of(context).primaryIconTheme,
        //   backgroundColor: AppColors.black1,
        //   title: Text(
        //     "ألقبله ",
        //     style: AppTextStyles.tajawalstyle22.copyWith(
        //       color: AppColors.white,
        //     ),
        //   ),
        // ),
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        body: hasPermission ? buildQiblahView() : buildPermissionRequest(),
      ),
    );
  }

  Widget buildQiblahView() {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.green),
          );  
        }

        final qiblahDirection = snapshot.data;
        if (qiblahDirection != null) {
          animation = Tween(begin: begin, end: (qiblahDirection.qiblah * (pi / 180) * -1)).animate(_animationController!);
          begin = (qiblahDirection.qiblah * (pi / 180) * -1);
          _animationController!.forward(from: 0);
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${qiblahDirection?.direction.toInt() ?? 0}°",
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: AnimatedBuilder(
                  animation: animation!,
                  builder: (context, child) => Transform.rotate(
                    angle: animation!.value,
                    child: Image.asset('assets/image/qibla.png'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildPermissionRequest() {
    return const Center(
      child: Text(
        'يجب منح إذن الموقع لعرض اتجاه القبلة',
        style: TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
