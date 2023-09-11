import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:hotel/data/mapper/global_mapper.dart';
import 'package:hotel/data/repository/api_global_repository.dart';

import '../../domain/repository/hotel_repository.dart';
import '../api/api_client.dart';

Future<void> configureDataDependencies() async {
  final getIt = GetIt.I;

  getIt.registerLazySingleton<HttpRequestExecutor>(
    () => HttpRequestExecutor(
      HttpClient(),
    ),
  );

  getIt.registerLazySingleton<IGlobalRepository>(
    () => ApiGlobalRepository(
      getIt.get<HttpRequestExecutor>(),
      getIt.get<IGlobalMapper>(),
    ),
  );
  getIt.registerLazySingleton<IGlobalMapper>(
    () => IGlobalMapper(),
  );
}
