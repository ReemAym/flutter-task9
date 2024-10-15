import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/Books_datails_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rate.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:bookly_app/styles.dart';

import '../../../../../core/widgets/books_action.dart';
import '../widgets/book_details_appbar.dart';
import 'custom_book_image.dart';
import 'package:flutter/material.dart';

import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                BookDetailsAppbar(),
                BooksDatailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                SimilarBooksSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
