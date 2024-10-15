import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rate.dart';
import 'package:bookly_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListviewItem extends StatelessWidget {
  const BookListviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.KBookDetailsView);
          },
          child: SizedBox(
            height: 125,
            child: AspectRatio(
              aspectRatio: 1.7 / 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('assets/images/test_image.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
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
                  'Harry Poter and the Golbet of Fire',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle20.copyWith(fontFamily: KGtSectraFine),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'J.k Rowling',
                style: Styles.textStyle14,
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '19.99 \$',
                    style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BookRate(),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
