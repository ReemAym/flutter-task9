import 'package:flutter/material.dart';

class BookDetailsAppbar extends StatelessWidget {
  const BookDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
