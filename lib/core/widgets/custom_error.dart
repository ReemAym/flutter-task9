import 'package:bookly_app/styles.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.erroMsg});

  final String erroMsg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        erroMsg,
        style: Styles.textStyle20,
        textAlign: TextAlign.center,
      ),
    );
  }
}
