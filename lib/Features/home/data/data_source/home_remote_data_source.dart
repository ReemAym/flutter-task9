import 'package:hive/hive.dart';
import 'package:new_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:new_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:new_bookly/constants.dart';

import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions/save_books.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> featchFeaturedBooks({int pageNum = 0});
  Future<List<BookEntity>> featchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> featchFeaturedBooks({int pageNum = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNum * 10}');

    List<BookEntity> books = getBooksList(data);
    saveData(books, KFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> featchNewestBooks() async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');

    List<BookEntity> books = getBooksList(data);
    saveData(books, KNewestBox);

    return books;
  }
}

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var bookModel in data['items']) {
    books.add(BookModel.fromJson(bookModel));
  }
  return books;
}
