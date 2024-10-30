part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

final class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String errorMsg;
  const FeaturedBooksPaginationFailure({required this.errorMsg});
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMsg;
  const FeaturedBooksFailure({required this.errorMsg});
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  const FeaturedBooksSuccess({required this.books});
}
