import 'package:dartz/dartz.dart';
import 'package:new_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:new_bookly/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> feachFeaturedBooks(
      {int pageNum = 0});
  Future<Either<Failure, List<BookEntity>>> feachNewestBooks();
}
