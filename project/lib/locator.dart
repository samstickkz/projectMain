import 'package:get_it/get_it.dart';

import 'core/services/app-cache.dart';
import 'core/services/initializer.dart';
import 'core/services/navigation_services.dart';
import 'core/services/storage-service.dart';
import 'core/services/user-enrollment-service.dart';
import 'core/services/user.service.dart';
import 'core/services/web-services/auth.api.dart';
import 'ui/auth/login/login.vm.dart';
import 'ui/auth/register/register.vm.dart';
import 'ui/base.vm.dart';

GetIt locator = GetIt.I;

//
void setupLocator(){
  registerViewModels();
  registerServices();
}

void registerViewModels() {
  /* TODO Setup viewModels*/
  locator.registerFactory<BaseViewModel>(() => BaseViewModel());
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<RegisterViewModel>(() => RegisterViewModel());


}

void registerServices(){
  /// Services
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton(() => Initializer());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => UserEnrollmentService());
  locator.registerLazySingleton(() => AppCache());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<AuthenticationApiService>(() => AuthenticationApiService());
}