import 'package:dartz/dartz.dart';
import 'package:new_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:new_bookly/core/errors/failure.dart';
import 'package:new_bookly/core/use_cases/use_case.dart';

import '../entities/book_entity.dart';

class FeachNewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FeachNewestBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> call([NoParam? params]) async {
    return await homeRepo.feachNewestBooks();
  }
}

class NoParam {}
