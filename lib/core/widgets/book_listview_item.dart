import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rate.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/book_model/book_model.dart';

class BookListviewItem extends StatelessWidget {
  const BookListviewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.KBookDetailsView,
              extra: bookModel,
            );
          },
          child: SizedBox(
              height: 125,
              child: CustomBookImage(
                  imageURL: bookModel.volumeInfo.imageLinks?.thumbnail ?? '')

              // AspectRatio(
              //   aspectRatio: 1.7 / 3,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(8),
              //       color: Colors.blue,
              //       image: DecorationImage(
              //         image: AssetImage('assets/images/test_image.png'),
              //         fit: BoxFit.fill,
              //       ),
              //     ),
              //   ),
              // ),
              ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  bookModel.volumeInfo.title ?? 'no title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20.copyWith(fontFamily: KGtSectraFine),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                bookModel.volumeInfo.authors?[0] ?? 'no available authors',
                style: Styles.textStyle14,
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Free',
                    style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BookRate(
                    rate: bookModel.volumeInfo.averageRating ?? 0,
                    count: bookModel.volumeInfo.ratingsCount ?? 0,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
