import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../coinpage_api/coinpage.dart';

//variables for items in the card
class CardModel {
  final String title;
  final String subtitle;
  final String deposit;
  final String withdraw;
  final Color titleColor;
  final Color subtitleColor;
  final String image;

  CardModel(
    this.deposit,
    this.withdraw,
    this.titleColor,
    this.subtitleColor,
    this.image, {
    required this.title,
    required this.subtitle,
  });
}

class CardCoin extends StatefulWidget {
  const CardCoin({super.key});

  @override
  State<CardCoin> createState() => _CardCoinState();
}

class _CardCoinState extends State<CardCoin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child:

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter amount',
                                      hintStyle: TextStyle(
                                        color: HexColor('E4E4F0'),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
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
                                    // Get.to(() => CoinPage());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: HexColor('4A4A58'),
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
                          ),
                        );
                        // Get.to(() => CoinPage());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('4A4A58'),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        primary: HexColor('4A4A58'),
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
    );
  }
}
