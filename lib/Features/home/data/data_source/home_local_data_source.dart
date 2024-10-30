import 'package:hive/hive.dart';
import 'package:new_bookly/constants.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeaturedBooks({int pageNum = 0});
  List<BookEntity> featchNewestBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> featchFeaturedBooks({int pageNum = 0}) {
    int startIndex = pageNum * 10;
    int endIndex = (pageNum + 1) * 10;

    var box = Hive.box<BookEntity>(KFeaturedBox);
    // box.clear();
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }

    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> featchNewestBooks() {
    var box = Hive.box<BookEntity>(KNewestBox);
    return box.values.toList();
  }
}
