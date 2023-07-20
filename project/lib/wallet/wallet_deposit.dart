import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:get/get.dart';
import 'package:project/style.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import '../model/model.dart';

class WalletDeposit extends StatefulWidget {
  const WalletDeposit({super.key});

  @override
  State<WalletDeposit> createState() => _WalletDepositState();
}

class _WalletDepositState extends State<WalletDeposit> {
  String walletAddress = '';
  bool isLoading = true;


  // Future<void> fetchWalletAddress() async {
  //   const apiUrl =
  //       'https://projectx-anf9.onrender.com/api/addresses/createaddress/3';
  //
  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       final decodedResponse = json.decode(response.body);
  //       final welcome = Welcome.fromJson(decodedResponse);
  //       setState(() {
  //         walletAddress = welcome.data.address;
  //       });
  //     } else {
  //       setState(() {
  //         print(response.body);
  //         walletAddress = 'Failed to fetch address.';
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //     setState(() {
  //       walletAddress = 'Error: $e';
  //     });
  //   }
  // }
  Future<void> fetchWalletAddress() async {
    const apiUrl = 'https://projectx-anf9.onrender.com/api/addresses/createaddress/3';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print(response.body);
        final decodedResponse = json.decode(response.body);
        final welcome = Welcome.fromJson(decodedResponse);
        setState(() {
          walletAddress = welcome.data.address;
          isLoading = false; // Data has been fetched, set isLoading to false
        });
      } else {
        setState(() {
          print(response.body);
          walletAddress = 'Failed to fetch address.';
          isLoading = false; // Error occurred, set isLoading to false
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        walletAddress = 'Error: $e';
        isLoading = false; // Error occurred, set isLoading to false
      });
    }
  }
  // @override
  // void initState() {
  //   super.initState();
  //   isLoading = true; // Initialize the variable
  //   fetchWalletAddress();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.backgroundColor,
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
                                    onPressed: () {
                                      fetchWalletAddress();
                                      //show modal bottom sheet
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  child:

                                                  // Replace the existing Shimmer widget with this:
                                                  isLoading
                                                      ? Shimmer.fromColors(
                                                    baseColor: Colors.grey, // Change to the desired shimmer base color
                                                    highlightColor: Colors.blueGrey, // Change to the desired shimmer highlight color
                                                    child: Container(
                                                      height: 15,
                                                      width: 100,
                                                      color: Colors.white, // Change to the desired background color of the shimmer
                                                    ),
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
                                                  Clipboard.setData(
                                                      ClipboardData(
                                                          text: walletAddress));
                                                   Get.snackbar(
                                                    'Copied',
                                                    'Address copied to clipboard',
                                                    backgroundColor:
                                                        Colors.white,
                                                    colorText:
                                                        HexColor('000000'),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      HexColor('4A4A58'),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                ),
                                                child: SizedBox(
                                                  width: 125,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Copy Address',
                                                        style: TextStyle(
                                                          color: HexColor(
                                                              'E4E4F0'),
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
