import 'package:get_it/get_it.dart';


final GetIt locator = GetIt.instance;

void setupLocator() async {
//  final prefs = await Preference.getInstance();
//  locator.registerLazySingleton(() => prefs);

  //firebase singleton
  //locator.registerLazySingleton(() => AuthAPI());

  // Repository/API singleton


  // Service singleton
  //locator.registerLazySingleton(() => LoginService());
}
