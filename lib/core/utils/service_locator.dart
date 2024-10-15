import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final get_it = GetIt.instance;

void setUpService_locator() {
  get_it.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  get_it.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      get_it.get<ApiService>(),
    ),
  );
}
