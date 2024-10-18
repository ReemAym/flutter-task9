import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/book_listview_item.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/no_result.dart';
import '../../manager/search_books_cubit/search_books_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
        builder: (context, state) {
      if (state is SearchBooksSuccess) {
        return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListviewItem(
                  bookModel: state.books[index],
                ),
              );
            });
      } else if (state is SearchBooksFailure) {
        return NoResult();
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
