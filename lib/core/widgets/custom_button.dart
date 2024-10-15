import 'package:bookly_app/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.text,
      this.borderRadius});

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        child: Text(
          text,
          style: Styles.textStyle18
              .copyWith(color: textColor, fontWeight: FontWeight.w900),
        ),
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
