import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  // NewsetBooksCubit(super.initialState, this.homeRepo);
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> feachSimilarBooks({required String category}) async {
    var result = await homeRepo.feachSimilarBooks(category: category);
    emit(SimilarBooksLoading());

    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errorMsg));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
