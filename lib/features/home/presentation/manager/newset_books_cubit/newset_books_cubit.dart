import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  // NewsetBooksCubit(super.initialState, this.homeRepo);
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> feachNewSetBooks() async {
    var result = await homeRepo.feachNewSetBooks();
    emit(NewsetBooksLoading());

    result.fold((failure) {
      emit(NewsetBooksFailure(failure.errorMsg));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
