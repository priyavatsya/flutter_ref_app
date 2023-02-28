import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/network/api/user/user_api.dart';
import 'data/network/dio_client.dart';
import 'data/repo/user_repository.dart';
import 'home/controller.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));

  getIt.registerSingleton(HomeController());
}

