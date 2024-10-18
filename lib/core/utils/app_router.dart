import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import '../../features/search/data/repos/search_repo_imp.dart';
import '../../features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const KHomeView = '/homeView';
  static const KBookDetailsView = '/bookDetailsView';
  static const KSearchView = '/searchView';
  static final router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return SplashView();
        }),
    GoRoute(
        path: KHomeView,
        builder: (context, state) {
          return HomeView();
        }),
    GoRoute(
        path: KBookDetailsView,
        builder: (context, state) {
          return BlocProvider(
              create: (context) => SimilarBooksCubit(get_it.get<HomeRepoImp>()),
              child: BookDetailsView(book: state.extra as BookModel));
        }),
    GoRoute(
        path: KSearchView,
        builder: (context, state) {
          return BlocProvider(
              create: (context) =>
                  SearchBooksCubit(get_it.get<SearchRepoImp>()),
              child: const SearchView());
        }),
  ]);
}
