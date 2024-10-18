import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/search_books_cubit/search_books_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onSearch});

  final Function(String)? onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onSearch,
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
