import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsAppbar extends StatelessWidget {
  const BookDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
