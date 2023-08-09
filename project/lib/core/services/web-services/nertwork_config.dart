import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../constants/constants.dart';

/**
 * this class has all network configurations
 */
class NetworkConfig {
  static String BASE_URL = baseUrl;
  static String FLUTTERWAVE_BASEURL = dotenv.env['FLUTTERWAVE_URL'] ?? "";
}
