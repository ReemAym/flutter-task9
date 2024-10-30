import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:new_bookly/Features/home/domain/use_cases/feach_featured_books_use_case.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.feachFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());

  FeachFeaturedBooksUseCase feachFeaturedBooksUseCase;
  void featchFeaturedBooks({int pageNum = 0}) async {
    if (pageNum == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await feachFeaturedBooksUseCase.call(pageNum);
    result.fold((failure) {
      if (pageNum == 0) {
        emit(FeaturedBooksFailure(errorMsg: failure.erroMsg));
      } else {
        emit(FeaturedBooksPaginationFailure(errorMsg: failure.erroMsg));
      }
    }, (booksList) {
      emit(FeaturedBooksSuccess(books: booksList));
    });
  }
}
