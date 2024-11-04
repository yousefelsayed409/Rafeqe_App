import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quranapp/core/utils/app_color.dart';
import 'package:quranapp/core/utils/app_styles.dart';
import 'package:quranapp/core/widgets/brain.dart';

class prayCard extends StatefulWidget {
  final String label;
  final String time;
  final IconData icon;

  const prayCard({required this.label, required this.icon, required this.time});

  @override
  State<prayCard> createState() => _prayCardState();
}

class _prayCardState extends State<prayCard> {
  var clicked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          context.read<Brain>().clicked ? Colors.grey : const Color(0xffF2F2F2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 0,
      margin: const EdgeInsets.all(15),
      child: ListTile(
        
        leading: Card(

          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 1.0,
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.icon,
              color: Colors.orangeAccent,
            ),
          ),
        ),
        title: Text(
          textAlign: TextAlign.center,
          widget.label,
 style: AppTextStyles.kufi16Style.copyWith(
  color: AppColors.black,
                                  fontWeight: FontWeight.bold),        ),
        trailing: Text(widget.time, style: AppTextStyles.kufi16Style.copyWith(
          color: AppColors.black,
                                  fontWeight: FontWeight.bold),),
        // trailing: GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       clicked = !clicked;
        //     });
        //   },
        //   child: Icon(
        //     clicked ? Icons.volume_up_rounded : CupertinoIcons.volume_off,
        //     color: kButtonColor,
        //   ),
        // ),
      ),
    );
  }
}
