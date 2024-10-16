import 'package:bookly_app/styles.dart';
import 'package:flutter/material.dart';

class BookRate extends StatelessWidget {
  const BookRate(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rate,
      required this.count});

  final num rate;
  final int count;

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
          '$rate',
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '($count)',
          style: Styles.textStyle14.copyWith(
            color: Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
