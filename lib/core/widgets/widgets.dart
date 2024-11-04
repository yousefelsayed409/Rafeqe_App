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
import 'package:quranapp/core/widgets/lists.dart';
import 'package:quranapp/featuers/home/presentation/manger/azkar_cubit/azkar_cubit.dart';


double lowerValue = 25.sp;
double upperValue = 40.sp;
String? selectedValue;
 
Widget container(BuildContext context, Widget myWidget, bool show,
    {double? height, double? width, Color? color}) {
  return ClipRRect(
    child: Container(
      height: height,
      width: width!.w,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.secondary,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          show == true
              ? Transform.translate(
                  offset: const Offset(0, -10),
                  child: Opacity(
                    opacity: .05,
                    child: SvgPicture.asset(
                      'assets/svg/azkary.svg',
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 15.h,
              width: MediaQuery.sizeOf(context).width,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: myWidget,
          )
        ],
      ),
    ),
  );
}


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
          decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12))),
          child: child,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: const BorderRadius.only(
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


// allModalBottomSheet(BuildContext context, Widget child) {
//   double hei = MediaQuery.sizeOf(context).height;
//   double wid = MediaQuery.sizeOf(context).width;
//   showModalBottomSheet(
//       context: context,
//       constraints: BoxConstraints(
//           maxWidth:
//               platformView(orientation(context, wid, wid / 1 / 2), wid / 1 / 2),
//           maxHeight: orientation(
//               context, hei * 3 / 4, platformView(hei, hei * 3 / 4))),
//       elevation: 0.0,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(8.0),
//           topRight: Radius.circular(8.0),
//         ),
//       ),
//       backgroundColor: Theme.of(context).colorScheme.background,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return child;
//       });
// }

customSnackBar(BuildContext context, String text) async {
  // final colorSchemeSurface = Theme.of(context).colorScheme.surface;

  var cancel = BotToast.showCustomNotification(
    enableSlideOff: false,
    toastBuilder: (cancelFunc) {
      return Container(
        height: 45.h,
        decoration: BoxDecoration(
            color: AppColors.bluecolor,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            )),
        margin: const EdgeInsets.symmetric(horizontal: 16.0).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: [
            Expanded(
              flex: 1,
              child: SvgPicture.asset(
                'assets/svg/snackBar_zakh.svg',
                color: AppColors.bluecolor,
              ),
            ),
            Expanded(
              flex: 7,
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'kufi',
                    fontStyle: FontStyle.italic,
                    fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: RotatedBox(
                quarterTurns: 2,
                child: SvgPicture.asset(
                  'assets/svg/snackBar_zakh.svg',
                  color: AppColors.bluecolor,
                ),
              ),
            ),
          ],
        ),
      );
    },
    duration: const Duration(milliseconds: 3000),
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
              child: SvgPicture.asset('assets/svg/slider_ic.svg',
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
      size: 25.h,
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


// platformView(var p1, p2) {
//   return (Platform.isIOS || Platform.isAndroid || Platform.isFuchsia) ? p1 : p2;
// }

// screenModalBottomSheet(BuildContext context, Widget child) {
//   double hei = MediaQuery.sizeOf(context).height;
//   double wid = MediaQuery.sizeOf(context).width;
//   showModalBottomSheet(
//       context: context,
//       constraints: BoxConstraints(
//           maxWidth: platformView(
//               orientation(context, wid, wid * .7), wid / 1 / 2 * 1.5),
//           maxHeight:
//               orientation(context, hei * .9, platformView(hei, hei * 3 / 4))),
//       elevation: 0.0,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(8.0),
//           topRight: Radius.circular(8.0),
//         ),
//       ),
//       backgroundColor: Theme.of(context).colorScheme.background,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return child;
//       });
// }
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
// Widget borderRadiusContainer(
//     BuildContext context, bool show, String title, String details,
//     {double? height, double? width, Color? color}) {
//   return ClipRRect(
//     child: Container(
//       height: height!.h,
//       width: width!.w,
//       alignment: Alignment.bottomCenter,
//       decoration: BoxDecoration(
//         color: color ?? Theme.of(context).colorScheme.secondary,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(8),
//           topRight: Radius.circular(8),
//         ).r,
//       ),
//       child: Stack(
//         children: [
//           show == true
//               ? Transform.translate(
//                   offset: const Offset(0, -10),
//                   child: Opacity(
//                     opacity: .05,
//                     child: SvgPicture.asset(
//                       'assets/svg/azkary.svg',
//                       width: MediaQuery.sizeOf(context).width,
//                     ),
//                   ),
//                 )
//               : Container(),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 25.h,
//               width: MediaQuery.sizeOf(context).width,
//               color: Theme.of(context).colorScheme.surface,
//               child: ClipRRect(
//                 child: SvgPicture.asset(
//                   'assets/svg/azkary.svg',
//                   colorFilter: ColorFilter.mode(
//                       Theme.of(context).canvasColor.withOpacity(.05),
//                       BlendMode.srcIn),
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//             ),
//           ),
//           orientation(
//               context,
//               Align(
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       width: 200.w,
//                       margin: const EdgeInsets.only(right: 16.0).r,
//                       child: Text(
//                         details,
//                         style: TextStyle(
//                           fontSize: 19.sp,
//                           fontFamily: 'naskh',
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).colorScheme.surface,
//                         ),
//                         textAlign: TextAlign.right,
//                       ),
//                     ),
//                     Container(
//                       height: 120.h,
//                       width: 75.h,
//                       margin: const EdgeInsets.all(16.0),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           // book_cover(),
//                           Transform.translate(
//                             offset: const Offset(0, 10),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 title,
//                                 style: TextStyle(
//                                   fontSize: 14.sp,
//                                   fontFamily: 'kufi',
//                                   fontWeight: FontWeight.bold,
//                                   color: Theme.of(context).canvasColor,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       height: 140.h,
//                       width: 90.h,
//                       margin: const EdgeInsets.all(16.0).r,
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           book_cover(),
//                           Transform.translate(
//                             offset: const Offset(0, 10),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0).r,
//                               child: Text(
//                                 title,
//                                 style: TextStyle(
//                                   fontSize: 16.sp,
//                                   fontFamily: 'kufi',
//                                   fontWeight: FontWeight.bold,
//                                   color: Theme.of(context).canvasColor,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 230.w,
//                       child: Text(
//                         details,
//                         style: TextStyle(
//                           fontSize: 18.sp,
//                           fontFamily: 'naskh',
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).colorScheme.surface,
//                         ),
//                         textAlign: TextAlign.right,
//                       ),
//                     ),
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     ),
//   );
// }

// Widget borderRadiusContainerLand(
//     BuildContext context, bool show, String title, String details,
//     {double? height, double? width, Color? color}) {
//   return ClipRRect(
//     child: Container(
//       height: height!,
//       width: width!.w,
//       alignment: Alignment.bottomCenter,
//       decoration: BoxDecoration(
//         color: color ?? Theme.of(context).colorScheme.secondary,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(8),
//           topRight: Radius.circular(8),
//         ).r,
//       ),
//       child: Stack(
//         children: [
//           show == true
//               ? Transform.translate(
//                   offset: const Offset(0, -10),
//                   child: Opacity(
//                     opacity: .05,
//                     child: SvgPicture.asset(
//                       'assets/svg/azkary.svg',
//                       width: MediaQuery.sizeOf(context).width,
//                     ),
//                   ),
//                 )
//               : Container(),
//           Align(
//             alignment: Alignment.center,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   height: 140.h,
//                   width: 90.h,
//                   margin: const EdgeInsets.all(16.0).r,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       book_cover(),
//                       Transform.translate(
//                         offset: const Offset(0, 10),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0).r,
//                           child: Text(
//                             title,
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                               fontFamily: 'kufi',
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context).canvasColor,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 230.w,
//                   child: Text(
//                     details,
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       fontFamily: 'naskh',
//                       fontWeight: FontWeight.bold,
//                       color: Theme.of(context).colorScheme.surface,
//                     ),
//                     textAlign: TextAlign.right,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
// book_cover() {
//   return ClipRRect(
//     borderRadius: const BorderRadius.all(Radius.circular(4)),
//     child: SvgPicture.asset(
//       'assets/svg/azkary_book.svg',
//       fit: BoxFit.cover,
//     ),
//   );
// }