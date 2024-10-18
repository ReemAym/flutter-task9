import 'package:bookly_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../manager/search_books_cubit/search_books_cubit.dart';
import 'custom_search_textfield.dart';
import 'search_result.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomSearchTextField(
            onSearch: (value) {
              BlocProvider.of<SearchBooksCubit>(context)
                  .feachSearchBooks(searchKey: value);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Search results',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
