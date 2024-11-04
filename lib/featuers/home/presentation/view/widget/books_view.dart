import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quranapp/core/utils/app_color.dart';
import 'package:quranapp/core/widgets/azkar_item.dart';
import 'package:quranapp/core/widgets/lists.dart';
import 'package:quranapp/core/widgets/lottie.dart';
import 'package:quranapp/core/widgets/widgets.dart';

import '../../manger/Books_cubit/books_cubit.dart';


class BooksView extends StatefulWidget {
  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          decoration: BoxDecoration(
              color: AppColors.coloBackHadith1,
              borderRadius: const BorderRadius.all(Radius.circular(8.0)).r),
          child: orientation(
              context,
              Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                      child: booksView(context),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // customClose(context),
                          fontSizeDropDown(context, setState,
                              AppColors.black),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 48.0).r,
                      child: booksView(context),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Column(
                        children: [
                          // customClose(context),
                          fontSizeDropDown(context, setState,
                          
                              AppColors.black),
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  Widget booksView(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is ClassSelected) {
          return Padding(
            padding: orientation(context, const EdgeInsets.only(top: 30.0).r,
                const EdgeInsets.only(top: 16.0).r),
            child: PageView.builder(
                itemCount: state.selectedClass.pages.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: (index % 2 == 0
                        ? rightPage(
                            context,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0)
                                  .r,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text.rich(
                                    TextSpan(children: [
                                      WidgetSpan(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          state.selectedClass.pages[index]
                                                      .title ==
                                                  ''
                                              ? Container()
                                              : greenContainer(
                                                colors:AppColors.coloBackHadith2 ,
                                                  context,
                                                  80.0,
                                                  
                                                  Container(
                                                    alignment: Alignment.center,
                                                    // width: 270,
                                                    margin: const EdgeInsets
                                                                .symmetric(
                                                            vertical: 8.0,
                                                            horizontal: 32.0)
                                                        .r,
                                                    child: Text(
                                                      state.selectedClass
                                                          .pages[index].title,
                                                      style: TextStyle(
                                                          color: AppColors.white,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'naskh',
                                                          height: 1.5),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                ),
                                          const Divider(
                                            color:AppColors.coloBackHadith2 ,
                                          ),
                                        ],
                                      )),
                                      TextSpan(
                                        text: state
                                            .selectedClass.pages[index].text,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: AzkarItem.fontSizeAzkar,
                                            fontFamily: 'naskh',
                                            fontStyle: FontStyle.italic),
                                      ),
                                      WidgetSpan(
                                          child: Column(
                                        children: [
                                          state.selectedClass.pages[index]
                                                      .footnote ==
                                                  ''
                                              ? Container()
                                              : Column(
                                                  children: [
                                                    const Divider(
                                                      color:AppColors.coloBackHadith2 ,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 32.0),
                                                      child: Text(
                                                        state
                                                            .selectedClass
                                                            .pages[index]
                                                            .footnote,
                                                        style: TextStyle(
                                                            color: AppColors.black,
                                                            fontSize: 20,
                                                            fontFamily: 'naskh',
                                                            fontStyle: FontStyle
                                                                .italic),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          const Divider(
                                            color:AppColors.coloBackHadith2 ,
                                          ),
                                        ],
                                      ))
                                    ]),
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.visible,
                                    // showCursor: true,
                                    // cursorWidth: 3,
                                    // cursorColor: Theme.of(context).dividerColor,
                                    // cursorRadius: const Radius.circular(5),
                                    // scrollPhysics: const ClampingScrollPhysics(),
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0),
                                      child: Text(
                                        state.selectedClass.pages[index]
                                            .pageNumber,
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 18,
                                          fontFamily: 'kufi',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : leftPage(
                            context,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0)
                                  .r,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text.rich(
                                    TextSpan(children: [
                                      WidgetSpan(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          state.selectedClass.pages[index]
                                                      .title ==
                                                  ''
                                              ? Container()
                                              : greenContainer(
                                                colors:AppColors.coloBackHadith2 ,
                                                  context,
                                                  80.0,
                                                  Container(
                                                    alignment: Alignment.center,
                                                    // width: 270,
                                                    margin: const EdgeInsets
                                                                .symmetric(
                                                            vertical: 8.0,
                                                            horizontal: 32.0)
                                                        .r,
                                                    child: Text(
                                                      state.selectedClass
                                                          .pages[index].title,
                                                      style: TextStyle(
                                                          color: AppColors.white,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'naskh',
                                                          height: 1.5),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                ),
                                          const Divider(
                                            color:AppColors.coloBackHadith2 ,
                                          ),
                                        ],
                                      )),
                                      TextSpan(
                                        text: state
                                            .selectedClass.pages[index].text,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: AzkarItem.fontSizeAzkar,
                                            fontFamily: 'naskh',
                                            fontStyle: FontStyle.italic),
                                      ),
                                      WidgetSpan(
                                          child: Column(
                                        children: [
                                          state.selectedClass.pages[index]
                                                      .footnote ==
                                                  ''
                                              ? Container()
                                              : Column(
                                                  children: [
                                                    const Divider(
                                           color: AppColors.bluecolor,

                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 32.0),
                                                      child: Text(
                                                        state
                                                            .selectedClass
                                                            .pages[index]
                                                            .footnote,
                                                        style: TextStyle(
                                                            color: AppColors.black,
                                                            fontSize: 20,
                                                            fontFamily: 'naskh',
                                                            fontStyle: FontStyle
                                                                .italic),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          const Divider(
                                        color:AppColors.coloBackHadith2 ,

                                          ),
                                        ],
                                      ))
                                    ]),
                                    textAlign: TextAlign.justify,
                                    // showCursor: true,
                                    // cursorWidth: 3,
                                    // cursorColor: Theme.of(context).dividerColor,
                                    // cursorRadius: const Radius.circular(5),
                                    // scrollPhysics: const ClampingScrollPhysics(),
                                    textDirection: TextDirection.rtl,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0),
                                      child: Text(
                                        state.selectedClass.pages[index]
                                            .pageNumber,
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 18,
                                          fontFamily: 'kufi',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                  );
                }),
          );
        } else {
          return Center(child: bookLoading(200.0.r, 200.0.r));
        }
      },
    );
  }
}
