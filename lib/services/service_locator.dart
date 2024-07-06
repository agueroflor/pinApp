import 'package:get_it/get_it.dart';

import 'package:pin_app/utils/services.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}