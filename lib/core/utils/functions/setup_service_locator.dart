import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/home/data/data_source/home_local_data_source.dart';
import '../../../Features/home/data/data_source/home_remote_data_source.dart';
import '../../../Features/home/data/repos/home_repo_imp.dart';
import '../api_service.dart';

final getit = GetIt.instance;

void setUpServiceLocator() {
  getit.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getit.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      homeRemoteDate: HomeRemoteDataSourceImpl(
        getit.get<ApiService>(),
      ),
      homelocalDate: HomeLocalDataSourceImpl(),
    ),
  );
}
