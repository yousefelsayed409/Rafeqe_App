import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quranapp/core/service/service.dart';
import 'package:quranapp/featuers/home/data/model/calss_model.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());
  static BooksCubit get(context) => BlocProvider.of<BooksCubit>(context);

  PageController? pageController;
  final int numPages = 3; // The number of pages
  int currentPage = 0;


  Future<List<Class>> getClasses() async {
    // Emit loading state
    emit(ClassesLoading());

    try {
      // Fetch classes
      final classes = await fetchClasses();

      // Emit loaded state
      emit(ClassesLoaded(classes));

      // Return the fetched classes
      return classes;
    } catch (e, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
      emit(ClassesError(e));

      // In case of error, throw the exception
      throw e;
    }
  }


  void selectClass(Class selectedClass) {
    emit(ClassSelected(selectedClass));
  }
}
