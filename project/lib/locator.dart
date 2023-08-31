import 'package:get_it/get_it.dart';

import 'core/services/app-cache.dart';
import 'core/services/initializer.dart';
import 'core/services/navigation_services.dart';
import 'core/services/storage-service.dart';
import 'core/services/user-enrollment-service.dart';
import 'core/services/user.service.dart';
import 'core/services/web-services/auth.api.dart';
import 'core/services/web-services/external_api.dart';
import 'ui/auth/checkPin/check.pin.vm.dart';
import 'ui/auth/login/login.vm.dart';
import 'ui/auth/pin_code/create.pin.vm.dart';
import 'ui/auth/pin_code/finish_pin.vm.dart';
import 'ui/auth/register/register.vm.dart';
import 'ui/base.vm.dart';
import 'ui/home/bottom_navigation.vm.dart';
import 'ui/home/navigations/draw/draw_entry_point.vm.dart';
import 'ui/home/navigations/home/buy_token/buy.token.vm.dart';
import 'ui/home/navigations/home/drawer/drawer.vm.dart';
import 'ui/home/navigations/home/home.vm.dart';
import 'ui/home/navigations/profile/profile.home.vm.dart';

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
  locator.registerFactory<BottomNavigationViewModel>(() => BottomNavigationViewModel());
  locator.registerFactory<HomePageViewModel>(() => HomePageViewModel());
  locator.registerFactory<BuyTokenViewModel>(() => BuyTokenViewModel());
  locator.registerFactory<DrawerViewModel>(() => DrawerViewModel());
  locator.registerFactory<ProfileHomeViewModel>(() => ProfileHomeViewModel());
  locator.registerFactory<CreatePinViewModel>(() => CreatePinViewModel());
  locator.registerFactory<FinishPinViewModel>(() => FinishPinViewModel());
  locator.registerFactory<CheckPinViewModel>(() => CheckPinViewModel());
  locator.registerFactory<DrawEntryPointViewModel>(() => DrawEntryPointViewModel());


}

void registerServices(){
  /// Services
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton(() => Initializer());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => ExternalApiServices());
  locator.registerLazySingleton(() => UserEnrollmentService());
  locator.registerLazySingleton(() => AppCache());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton<AuthenticationApiService>(() => AuthenticationApiService());
}