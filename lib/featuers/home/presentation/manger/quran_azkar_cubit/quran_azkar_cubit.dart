// import 'dart:convert';

// import 'package:bloc/bloc.dart';
// import 'package:flutter/services.dart';
// import 'package:meta/meta.dart';
// import 'package:quranapp/featuers/home/data/model/surah_zikr_model.dart';

// part 'quran_azkar_state.dart';

// class QuranAzkarCubit extends Cubit<QuranAzkarState> {
//   QuranAzkarCubit() : super(QuranAzkarInitial());
//    Future<void> loadData() async {
//     final response = await rootBundle.loadString('assets/books/quran_azkar.json');
//     final data = await json.decode(response);
//     final surahs = (data['surahs'] as List).map((i) => Surah.fromJson(i)).toList();

//     emit(surahs as QuranAzkarState);
//   }
// }
