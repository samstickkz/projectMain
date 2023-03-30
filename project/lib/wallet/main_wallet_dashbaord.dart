import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:intl/intl.dart';

import 'package:project/wallet/portfolio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  late Timer _timer;
  Map<String, dynamic> _cryptoPriceData = {};

  bool _isLoading = true;

  // index for navbar

  Future<void> fetchCryptoPrice() async {
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
  }

  @override
  void initState() {
    super.initState();
    // Fetch the crypto price data when the widget is first created
    fetchCryptoPrice();

    // Set up a timer to refresh the crypto price data every 5 minutes
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      fetchCryptoPrice();
    });
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
        title: const Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 25),
            child: Text(formattedDate),
          )
        ],
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
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Samuel Joseph',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'samstickkz@gmail.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 231,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32)),
                      color: Colors.deepPurpleAccent.shade200,
                      // gradient: LinearGradient(
                      //     begin: Alignment.topLeft,
                      //     end: Alignment.bottomRight,
                      //     colors:
                      //
                      //     [
                      //       HexColor('6262D9'),
                      //       HexColor('9D62D9'),
                      //     ]
                      // ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 16, right: 16, bottom: 13),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Your Balance',
                                style: TextStyle(
                                  color: HexColor('D5D5E0'),
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                '\$2600.50',
                                style: TextStyle(
                                    color: HexColor('D5D5E0'),
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          // Row(
                          //   children: const [],
                          // ),
                          const SizedBox(
                            height: 39,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// top up button
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                                  width: 98.33,
                                  height: 101,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 21.0, vertical: 21),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.arrow_upward_outlined,
                                          color: HexColor('F2F2FA'),
                                        ),
                                        Text(
                                          'Top Up',
                                          style: TextStyle(
                                            color: HexColor('F2F2FA'),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // buy button
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                width: 98.33,
                                height: 101,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 21.0, vertical: 21),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: HexColor('F2F2FA'),
                                      ),
                                      Text(
                                        'Buy',
                                        style: TextStyle(
                                          color: HexColor('F2F2FA'),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              /// top ip button
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                width: 98.33,
                                height: 101,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 21.0, vertical: 21),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.minimize_rounded,
                                        color: HexColor('F2F2FA'),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Top Up',
                                        style: TextStyle(
                                          color: HexColor('F2F2FA'),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transactions',
                              style: TextStyle(
                                color: HexColor('E4E4F0'),
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                fontSize: 17,
                                color: HexColor('7878FA'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PortFolio(),
                                  ),
                                );
                              },
                              child: Container(
                                  height: 95,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: HexColor('232336'),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          'images/ADA 1.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Bought ADA',
                                              style: TextStyle(
                                                color: HexColor('E4E4F0'),
                                              ),
                                            ),
                                            Text(
                                              '\$${_cryptoPriceData['cardano']['usd'].toStringAsFixed(5)}',
                                              style: TextStyle(
                                                color: HexColor('E4E4F0'),
                                              ),
                                            ),
                                            Text(
                                              '30 Jul 2022, 3.30 PM',
                                              style: TextStyle(
                                                color: HexColor('A7A7CC'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '+0.65 ETH',
                                              style: TextStyle(
                                                color: HexColor('E4E4F0'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                                height: 73,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: HexColor('232336'),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'images/Ethereum icon.png',
                                        height: 32,
                                        width: 32,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ethereum',
                                            style: TextStyle(
                                              color: HexColor('E4E4F0'),
                                              fontSize: 17,
                                            ),
                                          ),
                                          Text(
                                            'ETH',
                                            style: TextStyle(
                                              color: HexColor('A7A7CC'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${_cryptoPriceData['ethereum']['usd'].toStringAsFixed(2)}',
                                            style: TextStyle(
                                              color: HexColor('E4E4F0'),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '+0.54%',
                                                style: TextStyle(
                                                  color: HexColor('7878FA'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Watchlist',
                                  style: TextStyle(
                                    color: HexColor('E4E4F0'),
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                                height: 73,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: HexColor('232336'),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'images/Bitcoin.png',
                                        height: 32,
                                        width: 32,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Bitcoin",
                                            style: TextStyle(
                                              color: HexColor('E4E4F0'),
                                              fontSize: 17,
                                            ),
                                          ),
                                          Text(
                                            'BTC',
                                            style: TextStyle(
                                              color: HexColor('A7A7CC'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _isLoading
                                              ? const CircularProgressIndicator(
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                )
                                              : Text(
                                                  '\$${_cryptoPriceData['bitcoin']['usd'].toStringAsFixed(2)}',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                          Row(
                                            children: [
                                              Text(
                                                '+0.54%',
                                                style: TextStyle(
                                                  color: HexColor('7878FA'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                                height: 73,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: HexColor('232336'),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'images/Ethereum icon.png',
                                        height: 32,
                                        width: 32,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ethereum',
                                            style: TextStyle(
                                              color: HexColor('E4E4F0'),
                                              fontSize: 17,
                                            ),
                                          ),
                                          Text(
                                            'ETH',
                                            style: TextStyle(
                                              color: HexColor('A7A7CC'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${_cryptoPriceData['ethereum']['usd'].toStringAsFixed(2)}',
                                            style: TextStyle(
                                              color: HexColor('E4E4F0'),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '+0.54%',
                                                style: TextStyle(
                                                  color: HexColor('7878FA'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 73,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: HexColor('232336'),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'images/Bitcoin.png',
                                        height: 32,
                                        width: 32,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Bitcoin",
                                            style: TextStyle(
                                              color: HexColor('E4E4F0'),
                                              fontSize: 17,
                                            ),
                                          ),
                                          Text(
                                            'BTC',
                                            style: TextStyle(
                                              color: HexColor('A7A7CC'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          _isLoading
                                              ? const CircularProgressIndicator(
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                )
                                              : Text(
                                                  '\$${_cryptoPriceData['bitcoin']['usd'].toStringAsFixed(2)}',
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white),
                                                ),
                                          Row(
                                            children: [
                                              Text(
                                                '+0.54%',
                                                style: TextStyle(
                                                  color: HexColor('7878FA'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
