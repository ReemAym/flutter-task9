import 'package:bookly_app/styles.dart';
import 'package:flutter/material.dart';

class BookRate extends StatelessWidget {
  const BookRate({super.key, this.mainAxisAlignment = MainAxisAlignment.start});

  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
          size: 18,
        ),
        SizedBox(
          width: 6.3,
        ),
        Text(
          '4.5',
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '(4560)',
          style: Styles.textStyle14.copyWith(
            color: Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
