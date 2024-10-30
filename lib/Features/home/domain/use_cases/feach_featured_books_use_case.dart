import 'package:dartz/dartz.dart';
import 'package:new_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:new_bookly/core/errors/failure.dart';
import 'package:new_bookly/core/use_cases/use_case.dart';

import '../entities/book_entity.dart';

class FeachFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FeachFeaturedBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> call([int pageNum = 0]) async {
    return await homeRepo.feachFeaturedBooks(pageNum: pageNum);
  }
}

class NoParam {}
