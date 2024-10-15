import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';

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
          return BookDetailsView();
        }),
    GoRoute(
        path: KSearchView,
        builder: (context, state) {
          return SearchView();
        }),
  ]);
}
