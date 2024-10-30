import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_bookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:new_bookly/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:new_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:new_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:new_bookly/core/errors/failure.dart';

class HomeRepoImp extends HomeRepo {
  HomeLocalDataSource homelocalDate;
  HomeRemoteDataSource homeRemoteDate;
  HomeRepoImp({required this.homelocalDate, required this.homeRemoteDate});

  @override
  Future<Either<Failure, List<BookEntity>>> feachFeaturedBooks(
      {int pageNum = 0}) async {
    try {
      var localBooks = await homelocalDate.featchFeaturedBooks(
        pageNum: pageNum,
      );
      if (localBooks.isNotEmpty) {
        return right(localBooks);
      }
//////////////////////////////
      var remoteBooks =
          await homeRemoteDate.featchFeaturedBooks(pageNum: pageNum);
      return right(remoteBooks);
    } catch (e) {
      if (e is DioException) return left(ServerFailure(erroMsg: e.toString()));

      return left(ServerFailure(erroMsg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> feachNewestBooks() async {
    try {
      var localBooks = await homelocalDate.featchNewestBooks();
      if (localBooks.isNotEmpty) {
        return right(localBooks);
      }
      var remoteBooks = await homeRemoteDate.featchNewestBooks();
      return right(remoteBooks);
    } catch (e) {
      if (e is DioException) return left(ServerFailure(erroMsg: e.toString()));

      return left(ServerFailure(erroMsg: e.toString()));
    }
  }
}
