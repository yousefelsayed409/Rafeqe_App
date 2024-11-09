import 'dart:io';

import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/handler_animation.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quranapp/core/utils/app_color.dart';
import 'package:quranapp/core/widgets/azkar_item.dart';
import 'package:quranapp/core/widgets/hadith_item.dart';
import 'package:quranapp/featuers/home/presentation/manger/azkar_cubit/azkar_cubit.dart';



String? selectedValue;
 



Widget rightPage(BuildContext context, Widget child) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 4.0, top: 16.0, bottom: 16.0).r,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))
                  .r),
          child: child,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 16.0, bottom: 16.0).r,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))
                  .r),
          child: child,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 12.0, top: 16.0, bottom: 16.0).r,
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))
                  .r),
          child: child,
        ),
      ),
    ],
  );
}

Widget leftPage(BuildContext context, Widget child) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 4.0, top: 16.0, bottom: 16.0),
        child: Container(
          decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12))),
          child: child,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
        child: Container(
          decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12))),
          child: child,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 16.0, bottom: 16.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12))),
          child: child,
        ),
      ),
    ],
  );
}





Widget fontSizeDropDown(BuildContext context, var setState, Color color) {
  AzkarCubit cubit = AzkarCubit.get(context);
  return DropdownButton2(
    isExpanded: true,
    items: [
      DropdownMenuItem<String>(
        child: FlutterSlider(
          values: [AzkarItem.fontSizeAzkar],
          max: 40,
          min: 18,
          rtl: true,
          trackBar: FlutterSliderTrackBar(
            inactiveTrackBarHeight: 5,
            activeTrackBarHeight: 5,
            inactiveTrackBar: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
            ),
            activeTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.bluecolor),
          ),
          handlerAnimation: const FlutterSliderHandlerAnimation(
              curve: Curves.elasticOut,
              reverseCurve: null,
              duration: Duration(milliseconds: 700),
              scale: 1.4),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            lowerValue = lowerValue;
            upperValue = upperValue;
            AzkarItem.fontSizeAzkar = lowerValue;
            cubit.saveAzkarFontSize(AzkarItem.fontSizeAzkar);
            setState(() {});
          },
          handler: FlutterSliderHandler(
            decoration: const BoxDecoration(),
            child: Material(
              type: MaterialType.circle,
              color: Colors.transparent,
              elevation: 3,
              child: SvgPicture.asset('assets/image/Settings.svg',
              height: 40.h,
              color: AppColors.bluecolor,
              ),
            ),
          ),
        ),
      )
    ],
    value: selectedValue,
    onChanged: (value) {
      setState(() {
        selectedValue = value as String;
      });
    },
    customButton: Icon(
      Icons.format_size,
      size: 30.h,
      color: color,
    ),
    iconStyleData: IconStyleData(
      iconSize: 40.h,
    ),
    buttonStyleData: ButtonStyleData(
      height: 60.w,
      width: 60.w,
      elevation: 0,
    ),
    dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(.9),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        padding: const EdgeInsets.only(left: 1, right: 1),
        maxHeight: 230,
        width: 280,
        elevation: 0,
        offset: const Offset(0, 0),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(8),
          thickness: MaterialStateProperty.all(6),
        )),
    menuItemStyleData: MenuItemStyleData(
      height: 45.h,
    ),
  );
}


Widget greenContainer(BuildContext context, double height, Widget myWidget,

    {double? width , Color ? colors}) {
  return Container(
    height: height.h,
    width: width!.w,
    decoration: BoxDecoration(
          color: colors?? AppColors.bluecolorobacity,

      borderRadius: BorderRadius.circular(11)
    ),
    // margin: EdgeInsets.symmetric(horizontal: 8.0),
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: ClipRRect(
      child: 
        
          myWidget
        
      
    ),
  );
}

Widget fontSizeDropDowntow(BuildContext context, var setState, Color color) {
  AzkarCubit cubit = AzkarCubit.get(context);
  return DropdownButton2(
    isExpanded: true,
    items: [
      DropdownMenuItem<String>(
        child: FlutterSlider(
          values: [HadithItem.fontSizeAzkar],
          max: 40,
          min: 18,
          rtl: true,
          trackBar: FlutterSliderTrackBar(
            inactiveTrackBarHeight: 5,
            activeTrackBarHeight: 5,
            inactiveTrackBar: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
            ),
            activeTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.bluecolor),
          ),
          handlerAnimation: const FlutterSliderHandlerAnimation(
              curve: Curves.elasticOut,
              reverseCurve: null,
              duration: Duration(milliseconds: 700),
              scale: 1.4),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            lowerValue = lowerValue;
            upperValue = upperValue;
            HadithItem.fontSizeAzkar = lowerValue;
            cubit.saveAzkarFontSize(HadithItem.fontSizeAzkar);
            setState(() {});
          },
          handler: FlutterSliderHandler(
            decoration: const BoxDecoration(),
            child: Material(
              type: MaterialType.circle,
              color: Colors.transparent,
              elevation: 3,
              child: SvgPicture.asset('assets/image/Settings.svg',
              color: AppColors.bluecolor,
                            height: 40.h,

              ),
            ),
          ),
        ),
      )
    ],
    value: selectedValue,
    onChanged: (value) {
      setState(() {
        selectedValue = value as String;
      });
    },
    customButton: Icon(
      Icons.format_size,
      size: 30.h,
      color: color,
    ),
    iconStyleData: IconStyleData(
      iconSize: 40.h,
    ),
    buttonStyleData: ButtonStyleData(
      height: 60.w,
      width: 60.w,
      elevation: 0,
    ),
    dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(.9),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        padding: const EdgeInsets.only(left: 1, right: 1),
        maxHeight: 230,
        width: 280,
        elevation: 0,
        offset: const Offset(0, 0),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(8),
          thickness: MaterialStateProperty.all(6),
        )),
    menuItemStyleData: MenuItemStyleData(
      height: 45.h,
    ),
  );
}




Widget customClose(BuildContext context) {
  return GestureDetector(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.close_outlined,
            size: 35.h,
            color: AppColors.white),
        Icon(Icons.close_outlined,
            size: 20.h,
           color: AppColors.white
                 ),
      ],
    ),
    onTap: () {
      Navigator.of(context).pop();
    },
  );
}
