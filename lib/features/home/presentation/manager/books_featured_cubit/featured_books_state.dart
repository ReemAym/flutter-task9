part of 'featured_books_cubit.dart';

// import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();
  List<Object?> get props => throw UnimplementedError();
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String error;

  FeaturedBooksFailure(this.error);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> books;

  FeaturedBooksSuccess(this.books);
}
