import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: buildOutlineBorder(),
        focusedBorder: buildOutlineBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(18),
    );
  }
}
