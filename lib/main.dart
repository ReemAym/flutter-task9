import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_bookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:new_bookly/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:new_bookly/Features/home/data/repos/home_repo_imp.dart';
import 'package:new_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:new_bookly/Features/home/domain/use_cases/feach_featured_books_use_case.dart';
import 'package:new_bookly/Features/home/domain/use_cases/feach_newest_books_use_case.dart';
import 'package:new_bookly/Features/home/presentation/maneger/featured_books_cubit/featured_books_cubit.dart';
import 'package:new_bookly/Features/home/presentation/maneger/newest_books_cubit/newest_books_cubit.dart';
import 'package:new_bookly/core/utils/api_service.dart';
import 'package:new_bookly/core/utils/simple_bloc_observer.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/functions/setup_service_locator.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  Hive.openBox<BookEntity>(KFeaturedBox);
  Hive.openBox<BookEntity>(KNewestBox);
  Bloc.observer = SimpleBlocObserver();
  setUpServiceLocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FeachFeaturedBooksUseCase(
                getit.get<HomeRepoImp>(),
              ),
            )..featchFeaturedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FeachNewestBooksUseCase(
                getit.get<HomeRepoImp>(),
              ),
            )..featchNewestBooks();
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
