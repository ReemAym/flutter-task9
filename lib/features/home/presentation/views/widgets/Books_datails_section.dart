import 'package:flutter/material.dart';

import '../../../../../core/widgets/books_action.dart';
import '../../../../../styles.dart';
import 'book_rate.dart';
import 'custom_book_image.dart';

class BooksDatailsSection extends StatelessWidget {
  const BooksDatailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.26),
          child: CustomBookImage(
            imageURL:
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fessential%2Fphoto%2Fbeautiful-sunrise-over-the-sea-gm610041376-104635145&psig=AOvVaw3t8FGIUb1IhCr8RP1yuqMp&ust=1729112052861000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJCZvcCikYkDFQAAAAAdAAAAABAE',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          'The Jungle Book',
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          'By Rudyard Kipling',
          style: Styles.textStyle18.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRate(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        SizedBox(
          height: 37,
        ),
        BooksAction(),
      ],
    );
  }
}
