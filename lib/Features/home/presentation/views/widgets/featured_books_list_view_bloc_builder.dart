import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:new_bookly/Features/home/presentation/maneger/featured_books_cubit/featured_books_cubit.dart';
import 'package:new_bookly/Features/home/presentation/views/widgets/featured_list_view_loading.dart';

import 'featured_list_view.dart';

class FeaturedBooksListViewBuilderBloc extends StatefulWidget {
  const FeaturedBooksListViewBuilderBloc({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBuilderBloc> createState() =>
      _FeaturedBooksListViewBuilderBlocState();
}

class _FeaturedBooksListViewBuilderBlocState
    extends State<FeaturedBooksListViewBuilderBloc> {
  List<BookEntity> allBooks = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          allBooks.addAll(state.books);
        }

        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnakBarError(state),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(
            books: allBooks,
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: Text(state.errorMsg),
          );
        } else {
          return const FeaturedBooksListViewLoading();
        }
      },
    );
  }

  SnackBar CustomSnakBarError(FeaturedBooksPaginationFailure state) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        state.errorMsg,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      duration: const Duration(seconds: 3),
    );
  }
}
