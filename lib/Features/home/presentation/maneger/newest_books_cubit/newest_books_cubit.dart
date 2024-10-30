import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_bookly/Features/home/domain/entities/book_entity.dart';

import '../../../domain/use_cases/feach_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.feachNewestBooksUseCase) : super(NewestBooksInitial());

  FeachNewestBooksUseCase feachNewestBooksUseCase;
  void featchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await feachNewestBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(errorMsg: failure.erroMsg));
    }, (booksList) {
      emit(NewestBooksSuccess(books: booksList));
    });
  }
}
