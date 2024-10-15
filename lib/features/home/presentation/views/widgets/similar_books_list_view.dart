import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomBookImage(
              imageURL:
                  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fessential%2Fphoto%2Fbeautiful-sunrise-over-the-sea-gm610041376-104635145&psig=AOvVaw3t8FGIUb1IhCr8RP1yuqMp&ust=1729112052861000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJCZvcCikYkDFQAAAAAdAAAAABAE',
            );
          }),
    );
  }
}
