import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quranapp/core/service/service.dart';
import 'package:quranapp/core/utils/app_assets.dart';
import 'package:quranapp/core/utils/app_color.dart';
import 'package:quranapp/core/widgets/brain.dart';
import 'package:quranapp/core/widgets/clock.dart';
import 'package:intl/intl.dart';
import 'package:quranapp/core/widgets/lottie.dart';
import 'package:quranapp/featuers/home/presentation/view/widget/pray_card.dart';

class PrayerTimeView extends StatefulWidget {
  const PrayerTimeView({super.key});

  @override
  State<PrayerTimeView> createState() => _PrayerTimeViewState();
}

class _PrayerTimeViewState extends State<PrayerTimeView> {
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _requestLocation();
  }

  Future<void> _requestLocation() async {
    bool permissionGranted = await _locationService.requestLocationPermission(context);

    if (permissionGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم الحصول على إذن الموقع بنجاح.'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يجب السماح بإذن الموقع لعرض مواقيت الصلاة.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String formatTime(String time) {
    final DateTime parsedTime = DateFormat("HH:mm").parse(time);
    return DateFormat("hh:mm a").format(parsedTime); // تحويل الوقت إلى تنسيق 12 ساعة
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Brain>(
      builder: (BuildContext context, value, Widget? child) {
        var jsonData = value.getJson();
        if (jsonData == null || jsonData['data'] == null || jsonData['data']['timings'] == null) {
          return Scaffold(
            body:  Center(
              child: circleLoading(150.0, 150.0)
            ),
          );
        }

        dynamic values = jsonData['data']['timings'];

        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.moveColor,
            body: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    AppAssets.imagePrayerTime,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.5.h,
                    width: double.infinity,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      width: 350.w,
                      height: 270.h,
                      child: const Clock(),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: const BoxDecoration(
                          color: AppColors.moveColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            prayCard(
                              icon: CupertinoIcons.sunrise_fill,
                              label: value.arabic ? "الفجر" : 'Fajr',
                              time: formatTime(values['Fajr'].toString()),
                            ),
                            prayCard(
                              icon: Icons.sunny,
                              label: value.arabic ? "الظهر" : 'Dhuhr',
                              time: formatTime(values['Dhuhr'].toString()),
                            ),
                            prayCard(
                              icon: Icons.wb_twilight_rounded,
                              label: value.arabic ? "العصر" : 'Asr',
                              time: formatTime(values['Asr'].toString()),
                            ),
                            prayCard(
                              icon: CupertinoIcons.sunset_fill,
                              label: value.arabic ? "المغرب" : 'Maghrib',
                              time: formatTime(values['Maghrib'].toString()),
                            ),
                            prayCard(
                              icon: Icons.nights_stay,
                              label: value.arabic ? "العشاء" : 'Isha',
                              time: formatTime(values['Isha'].toString()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
