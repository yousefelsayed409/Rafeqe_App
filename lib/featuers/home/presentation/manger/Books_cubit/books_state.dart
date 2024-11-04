part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}
class ClassesLoading extends BooksState {}

class ClassesLoaded extends BooksState {
  final List<Class> classes;
  ClassesLoaded(this.classes);
}

class ClassSelected extends BooksState {
  final Class selectedClass;
  ClassSelected(this.selectedClass);
}

class ClassesError extends BooksState {
  final dynamic error;

  ClassesError(this.error);
}