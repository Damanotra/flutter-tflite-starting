import 'package:get_it/get_it.dart';
import 'package:tflite_demo/resources/provider/api/auth_api.dart';
import 'package:tflite_demo/services/user_service.dart';

import 'resources/provider/api/user_api.dart';
import 'services/login_service.dart';


final GetIt locator = GetIt.instance;

void setupLocator() async {
//  final prefs = await Preference.getInstance();
//  locator.registerLazySingleton(() => prefs);

  //firebase singleton
  locator.registerLazySingleton<AuthAPI>(() => AuthAPI());
  locator.registerLazySingleton<UserAPI>(() => UserAPI());

  // Repository/API singleton


  // Service singleton
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => UserService());


}
