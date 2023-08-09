
import '../../../constants/constants.dart';
import '../../../locator.dart';
import '../storage-service.dart';
import '../user.service.dart';

class AuthenticationApiService {
  StorageService storageService = locator<StorageService>();
  UserService userService = locator<UserService>();


  storeToken(String? token, {bool saveUser = true}) async {
    //store token
    storageService.storeItem(key: accessToken, value: token);
    String tokens  = await storageService.readItem(key: accessToken);
    print("Access Token : $tokens");
  }
}
