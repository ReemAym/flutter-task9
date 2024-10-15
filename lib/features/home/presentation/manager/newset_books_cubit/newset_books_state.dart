part of 'newset_books_cubit.dart';

abstract class NewsetBooksState extends Equatable {
  const NewsetBooksState();
  List<Object?> get props => throw UnimplementedError();
}

class NewsetBooksInitial extends NewsetBooksState {}

class NewsetBooksLoading extends NewsetBooksState {}

class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookModel> books;

  NewsetBooksSuccess(this.books);
}

class NewsetBooksFailure extends NewsetBooksState {
  final String error;

  NewsetBooksFailure(this.error);
}
