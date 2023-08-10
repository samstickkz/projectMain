import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/reuseables.dart';
import '../core/models/model.dart';

class WalletDeposit extends StatefulWidget {
  const WalletDeposit({super.key});

  @override
  State<WalletDeposit> createState() => _WalletDepositState();
}

class _WalletDepositState extends State<WalletDeposit> {
  String walletAddress = '';
  bool isLoading = false;

  Future<void> fetchWalletAddress(BuildContext context) async {
    const apiUrl =
        'https://projectx-anf9.onrender.com/api/addresses/createaddress/3';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print(response.body);
        final decodedResponse = json.decode(response.body);
        final welcome = Welcome.fromJson(decodedResponse);
        setState(() {
          isLoading = false;

          walletAddress = welcome.data.address;
        });
      } else {
        setState(() {
          print(response.body);
          walletAddress = 'Failed to fetch address.';
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        walletAddress = 'Error: $e';
      });
    } finally {
      setState(() {
        isLoading =
            false; // Set isLoading to false in both success and error cases
      });
    }


  }


  void _showDepModal(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        color: HexColor('232336'),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Deposit',
              style: TextStyle(
                color: HexColor('E4E4F0'),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 100.0,
                child: isLoading
                    ? const Text(
                  'loading....',
                  style: TextStyle(color: AppStyle.textColorWhite),
                )
                    : Text(
                  walletAddress,
                  style: TextStyle(
                    color: HexColor('E4E4F0'),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //button
            ElevatedButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: walletAddress));
                Get.snackbar(
                  'Copied',
                  'Address copied to clipboard',
                  backgroundColor: Colors.white,
                  colorText: HexColor('000000'),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor('4A4A58'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: SizedBox(
                width: 125,
                child: Row(
                  children: [
                    Text(
                      'Copy Address',
                      style: TextStyle(
                        color: HexColor('E4E4F0'),
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.copy,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.1),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const Center(
                  child: Text(
                'Wallet',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor('232336'),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'images/Ethereum icon.png',
                                height: 32,
                                width: 32,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ethereum',
                                    style: TextStyle(
                                      color: HexColor('E4E4F0'),
                                      fontSize: 17,
                                    ),
                                  ),

                                  //button
                                  ElevatedButton(
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      await fetchWalletAddress(context);
                                      _showDepModal(context);
                                      //show modal bottom sheet
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: HexColor('4A4A58'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      'Deposit',
                                      style: TextStyle(
                                        color: HexColor('E4E4F0'),
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Balance: \$2000',
                                    style: TextStyle(
                                      color: HexColor('E4E4F0'),
                                    ),
                                  ),
                                  //withdraw button
                                  ElevatedButton(
                                    onPressed: () {
                                      // Get.to(() => CoinPage());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: HexColor('4A4A58'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      'Withdraw',
                                      style: TextStyle(
                                        color: HexColor('E4E4F0'),
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
