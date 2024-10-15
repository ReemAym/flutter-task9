import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/book_model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    var result = await homeRepo.feachFeaturedBooks();
    emit(FeaturedBooksLoading());

    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errorMsg));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
