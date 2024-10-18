import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  // NewsetBooksCubit(super.initialState, this.homeRepo);
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  final SearchRepo searchRepo;

  Future<void> feachSearchBooks({required String searchKey}) async {
    var result = await searchRepo.feachSearchBooks(searchKey: searchKey);
    emit(SearchBooksLoading());

    result.fold((failure) {
      emit(SearchBooksFailure(failure.errorMsg));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}
