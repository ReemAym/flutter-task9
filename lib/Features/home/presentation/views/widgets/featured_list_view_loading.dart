import 'package:flutter/material.dart';
import 'package:new_bookly/Features/home/presentation/views/widgets/Custom_book_image_loading.dart';
import 'package:new_bookly/core/widgets/custom_fading_widget.dart';

import 'custom_book_item.dart';

class FeaturedBooksListViewLoading extends StatelessWidget {
  const FeaturedBooksListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookImageLoading(),
              );
            }),
      ),
    );
  }
}
