import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quranapp/core/function/app_function.dart';
import 'package:quranapp/core/models/all_azkar.dart';
import 'package:quranapp/core/models/all_rwqya.dart';
import 'package:quranapp/core/utils/app_assets.dart';
import 'package:quranapp/core/utils/app_color.dart';
import 'package:quranapp/core/utils/app_styles.dart';
import 'package:quranapp/core/widgets/azkar_item.dart';
import 'package:quranapp/core/widgets/menu_item_to_hisn.dart';
import 'package:quranapp/core/widgets/rwqya_item.dart';
import 'package:quranapp/core/widgets/widgets.dart';
import 'package:quranapp/featuers/home/data/model/calss_model.dart';
import 'package:quranapp/featuers/home/presentation/manger/Books_cubit/books_cubit.dart';
import 'package:quranapp/featuers/home/presentation/manger/azkar_cubit/azkar_cubit.dart';
import 'package:quranapp/featuers/home/presentation/view/widget/books_view.dart';

class HisnView extends StatelessWidget {
  const HisnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bluecolorobacity,
        body: Stack(
          children: [
            Positioned(
              child: Image.asset(
                AppAssets.imagemuslimpray,
                fit: BoxFit.fill,
                height: 0.5.sh,
                width: double.infinity,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          '❤️${AppFunctions.getGreetings()} ',
                          style: AppTextStyles.kufi16Style.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.sh / 5),
                Padding(
                  padding: EdgeInsets.all(20.0.r),
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    decoration: const BoxDecoration(
                      color: AppColors.bluecolor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MenuItemToHisn(
                          onTap: () {
                         AppFunctions.screenModalBottomSheet(
                                context, hisnListBuild(context));
                          },
                          icon: FlutterIslamicIcons.muslim,
                          label: 'حصن المسلم',
                        ),
                       
                        
                         MenuItemToHisn(
                          onTap: () {
                          AppFunctions.  screenModalBottomSheet(
                                context, rwqyaBuild(context));
                          },
                          icon: FlutterIslamicIcons.family,
                          label: 'الرقية الشرعية',
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
  }
}





Widget rwqyaBuild(BuildContext context) {
  // ColorStyle colorStyle = ColorStyle(context);
  return AnimationLimiter(
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16.0).r,
      child: ListView.separated(
                physics: const BouncingScrollPhysics(),

        itemCount: allRwqyaDetails.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 450),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                      child: Container(
                    height: 50.h,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                        color: AppColors.bluecolorobacity),
                    child: InkWell(
                      onTap: () {
                      AppFunctions.  screenModalBottomSheet(
                            context,
                            RwqyaItem(
                              rwqya: allRwqyaDetails[index].toString().trim(),
                            ));
                      },
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ).r,
                              child: Text(
                                textAlign: TextAlign.right,
                                allRwqyaDetails[index].toString(),
                                style: AppTextStyles.vexatext18style,
                                softWrap: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))));
        },
      ),
    ),
  );
}

Widget hisnListBuild(BuildContext context) {
  // ColorStyle colorStyle = ColorStyle(context);
  return AnimationLimiter(
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16.0).r,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        controller: AzkarCubit.get(context).controller,
        itemCount: azkarDataList.length,
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 450),
              child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                      child: Container(
                    height: 50.h,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(8)),
                        color: AppColors.bluecolorobacity),
                    child: InkWell(
                      onTap: () {
                      AppFunctions.  screenModalBottomSheet( 
                        
                            context,
                            AzkarItem(
                              azkar: azkarDataList[index].toString().trim(),
                            ));
                      },
                      child: Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ).r,
                              child: Text(
                                azkarDataList[index].toString(),
                                style: AppTextStyles.vexatext18style,
                                softWrap: true,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                
                              ),
                            ),
                          ),
                    ),
                  ))));
        },
      ),
    ),
  );
}
