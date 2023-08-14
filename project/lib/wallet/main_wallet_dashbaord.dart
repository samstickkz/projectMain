import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:project/wallet/portfolio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../constants/palette.dart';
import '../constants/reuseables.dart';
import '../ui/auth/login/login.ui.dart';
import '../coinpage_api/coinpage.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:async';

import '../shimmer.dart';
import '../ui/widgets/apptexts.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

// final FirebaseAuth _auth = FirebaseAuth.instance;
class _SecondRouteState extends State<SecondRoute> {
  final currentUser = FirebaseAuth.instance.currentUser;
  // late String uid;
  //sing out

  late Timer _timer;
  Map<String, dynamic> _cryptoPriceData = {};

  bool _isLoading = true;
  TextEditingController amountController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String publicKey = 'pk_test_72e08d57e07a5fa900b5d4b536a677bb0c9e7a03';
  final plugin = PaystackPlugin();
  String message = '';
  // index for navbar
  Future<void> fetchCryptoPrice() async {
    try {
      plugin.initialize(publicKey: publicKey);
      final response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Ccardano%2Cethereum&vs_currencies=usd'));

      if (response.statusCode == 200) {
        setState(() {
          _cryptoPriceData = json.decode(response.body);
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch crypto prices');
      }
    } catch (e) {
      // handle the exception here
      print('Error fetching crypto prices: $e');
    }
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    // Set up a timer to refresh the crypto price data every 5 minutes
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      fetchCryptoPrice();
      plugin.initialize(publicKey: publicKey);
      // uid = currentUser?.uid ?? '';
    });
  }

  void makePayment() async {
    int price = int.parse(amountController.text) * 100;
    Charge charge = Charge()
      ..amount = price
      ..reference = 'ref_${DateTime.now()}'
      ..email = emailController.text
      ..currency = 'NGN';

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    if (response.status == true) {
      message = 'Payment was successful. Ref: ${response.reference}';
      //pop

      //pop with getx
      Get.back();

      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: "Your payment was successful",
        ),
      );
    } else {
      print(response.message);
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Cancel the timer when the widget is disposed to avoid memory leaks
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          'Welcome ${userService.userCredentials.name??""}',
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        elevation: 0,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                children: [
                  //profile
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset(
                      'images/sam.JPG',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  //Profile picture ends here
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Samuel Joseph',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        currentUser?.email ?? 'Sign in please',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        currentUser?.uid ?? 'Sign in to enjoy this app',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //Profile ends here
                ],
              ),
            ),
            //calender starts here
            ListTile(
              leading: const Icon(
                Icons.calculate_sharp,
                color: Colors.white,
              ),
              title: const Text(
                'Calculator',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: HexColor('8BC185'),
                ),
                child: const Center(
                    child: Text(
                  '4',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
              ),
              onTap: () {},
            ),
            //rewards
            ListTile(
              leading: const Icon(
                Icons.money_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'news',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: HexColor('8BC185'),
                ),
                child: const Center(
                    child: Text(
                  '11',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            //Address
            ListTile(
              leading: const Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.white,
              ),
              title: const Text(
                'Address',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.deepPurpleAccent.shade200,
                ),
                child: const Center(
                    child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            //Payments
            ListTile(
              leading: const Icon(
                Icons.wind_power,
                color: Colors.white,
              ),
              title: const Text(
                'Raffle',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Center(
                    child: Text(
                  '22',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            const SizedBox(
              height: 280,
            ),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white),
                ),
                child: const Icon(
                  Icons.question_mark,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  // login with getx
                  Get.offAll(() => const LoginPage());
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error signing out'),
                        content: Text('$e'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
      backgroundColor: Colors.black,
    );
  }
}
