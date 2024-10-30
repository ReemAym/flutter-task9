import 'package:hive/hive.dart';

import '../../../Features/home/domain/entities/book_entity.dart';

void saveData(List<BookEntity> books, String booksName) {
  var box = Hive.box<BookEntity>(booksName);
  box.addAll(books);
}
