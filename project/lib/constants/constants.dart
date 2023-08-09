import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../core/services/initializer.dart';
import '../locator.dart';

const String token = 'token';
const String userTypes = 'userTypes';
const String userTypeData = 'userTypeData';
const String accessToken = 'accessToken';
const String isSecured = 'isSecure_text';
const String refreshToken = 'refreshToken';
const String currentUser = 'currentUser';
const String settings = 'settings';
const String imagePath = "assets/images/";
String get baseUrl => dotenv.env['BASE_URL']!;
Initializer initializer = locator<Initializer>();