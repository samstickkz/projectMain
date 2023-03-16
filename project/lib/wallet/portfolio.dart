import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../creditcard/credit_card.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class PortFolio extends StatefulWidget {
  const PortFolio({Key? key}) : super(key: key);

  @override
  State<PortFolio> createState() => _PortFolioState();
}

class _PortFolioState extends State<PortFolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: HexColor('A7A7CC'),
                      size: 22,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: HexColor('E4E4F0'),
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    )
                  ],
                ),

                const SizedBox(
                  height: 29,
                ),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$6,242.50',
                          style: TextStyle(
                            color: HexColor('E4E4F0'),
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              '+1.56% (\$97.38)',
                              style: TextStyle(
                                color: HexColor('7878FA'),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Overall',
                              style: TextStyle(
                                color: HexColor('D5D5E0'),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 24,
                ),

                ///ring
                Container(
                  height: 285,
                  width: 285,
                  child: CircularPercentIndicator(
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Solana balance',
                          style: TextStyle(
                            color: HexColor('D5D5E0'),
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          '\$1560.60',
                          style: TextStyle(
                            color: HexColor('E4E4F0'),
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                          ),
                        ),
                        Text(
                          '+0.64% (\$9.98)',
                          style: TextStyle(
                            color: HexColor('7878FA'),
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    lineWidth: 30,
                    animateFromLastPercent: true,
                    percent: 0.7,
                    radius: 135.2,
                    progressColor: HexColor('3083BF'),
                    backgroundColor: HexColor('8143BF'),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          children: [

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
                                        builder: (context) => MySample(),
                                      ),
                                    );
                                  },
                                  child: Container(
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
                                              'images/Solana icon.png',
                                              height: 32,
                                              width: 32,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Solana',
                                                  style: TextStyle(
                                                    color: HexColor('E4E4F0'),
                                                    fontSize: 17,
                                                  ),
                                                ),
                                                // Text(
                                                //   '-\$812.10',
                                                //   style: TextStyle(
                                                //     color: HexColor('A7A7CC'),
                                                //   ),
                                                // ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '30 Jul 2022, 3.30 PM',
                                                      style: TextStyle(
                                                        color:
                                                            HexColor('A7A7CC'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '+0.65 ETH',
                                                  style: TextStyle(
                                                    color: HexColor('E4E4F0'),
                                                  ),
                                                ),
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
                                      )),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                'Bitcoin',
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
                                              Text(
                                                '\$21,262.60',
                                                style: TextStyle(
                                                  color: HexColor('E4E4F0'),
                                                ),
                                              ),
                                              Row(
                                                // mainAxisAlignment: MainAxisAlignment.end,
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
                                              // Text('-\$812.10', style: TextStyle(
                                              //   color: HexColor('A7A7CC'),
                                              // ),),

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
                                                '\$1,225.85',
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
        ),
        bottomNavigationBar: GNav(
        // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration:
                const Duration(milliseconds: 900), // tab animation duration

            color: Colors.grey, // unselected icon color
            activeColor: Colors.purple, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
                Colors.purple.withOpacity(0.1), // selected tab background color

            tabs: const [
              GButton(
                icon: LineIcons.home,
              ),
              GButton(
                icon: LineIcons.wallet,
              ),
              GButton(
                icon: LineIcons.barChart,
              ),
              GButton(
                icon: LineIcons.user,
              )
            ]));
  }
}
