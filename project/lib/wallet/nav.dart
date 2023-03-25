import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project/wallet/portfolio.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import '../creditcard/credit_card.dart';
import '../price change.dart';
import 'main_wallet_dashbaord.dart';
class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}
int selectedIndex = 0;
final _pageOptions = [
  const SecondRoute(),
  const MySample(),
  const PortFolio(),
  const ProfilePage(),


];
class _NavPageState extends State<NavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:
        _pageOptions.elementAt(selectedIndex),
        // SafeArea(
        //   child: Column(
        //     children: [
        //       Container(
        //         height: 350,
        //         width: double.infinity,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(32),
        //             gradient: LinearGradient(
        //                 begin: Alignment.topLeft,
        //                 end: Alignment.bottomRight,
        //                 colors: [
        //                   HexColor('6262D9'),
        //                   HexColor('9D62D9'),
        //                 ])),
        //         child: Padding(
        //           padding: const EdgeInsets.only(
        //               top: 50.0, left: 16, right: 16, bottom: 13),
        //           child: Column(
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Icon(
        //                     Icons.menu,
        //                     color: HexColor('A7A7CC'),
        //                   ),
        //                   Text(
        //                     'Home',
        //                     style: TextStyle(
        //                       color: HexColor('E4E4F0'),
        //                     ),
        //                   ),
        //                   Text(formattedDate  ,style: TextStyle(
        //                       color: HexColor('D5D5E0'),
        //                       fontSize: 12,
        //
        //                       fontWeight: FontWeight.bold),),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 33,
        //               ),
        //               Row(
        //
        //                 children: [
        //                   Text(
        //                     'Your Balance',
        //                     style: TextStyle(
        //                       color: HexColor('D5D5E0'),
        //                       fontSize: 22,
        //                     ),
        //                   ),
        //
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 4,
        //               ),
        //               Row(
        //                 children: [
        //                   Text(
        //                     '\$2600.50',
        //                     style: TextStyle(
        //                         color: HexColor('D5D5E0'),
        //                         fontSize: 34,
        //                         fontWeight: FontWeight.bold),
        //                   ),
        //
        //
        //                 ],
        //               ),
        //               SizedBox(height: 2,),
        //               Row(
        //                 children: [
        //
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 39,
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   /// top up button
        //                   GestureDetector(
        //                     onTap: () {
        //
        //                     },
        //                     child: Container(
        //                       decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(16),
        //                         color: Colors.white.withOpacity(0.3),
        //                       ),
        //                       width: 98.33,
        //                       height: 101,
        //                       child: Padding(
        //                         padding: const EdgeInsets.symmetric(
        //                             horizontal: 21.0, vertical: 21),
        //                         child: Column(
        //                           mainAxisAlignment:
        //                           MainAxisAlignment.spaceBetween,
        //                           children: [
        //                             Icon(
        //                               Icons.arrow_upward_outlined,
        //                               color: HexColor('F2F2FA'),
        //                             ),
        //                             Text(
        //                               'Top Up',
        //                               style: TextStyle(
        //                                 color: HexColor('F2F2FA'),
        //                                 fontSize: 15,
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //
        //                   // buy button
        //                   Container(
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(16),
        //                       color: Colors.white.withOpacity(0.3),
        //                     ),
        //                     width: 98.33,
        //                     height: 101,
        //                     child: Padding(
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 21.0, vertical: 21),
        //                       child: Column(
        //                         mainAxisAlignment:
        //                         MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Icon(
        //                             Icons.add,
        //                             color: HexColor('F2F2FA'),
        //                           ),
        //                           Text(
        //                             'Buy',
        //                             style: TextStyle(
        //                               color: HexColor('F2F2FA'),
        //                               fontSize: 15,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //
        //                   /// top ip button
        //                   Container(
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(16),
        //                       color: Colors.white.withOpacity(0.3),
        //                     ),
        //                     width: 98.33,
        //                     height: 101,
        //                     child: Padding(
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 21.0, vertical: 21),
        //                       child: Column(
        //                         mainAxisAlignment:
        //                         MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Icon(
        //                             Icons.minimize_rounded,
        //                             color: HexColor('F2F2FA'),
        //                           ),
        //                           const SizedBox(
        //                             height: 5,
        //                           ),
        //                           Text(
        //                             'Top Up',
        //                             style: TextStyle(
        //                               color: HexColor('F2F2FA'),
        //                               fontSize: 15,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       Expanded(
        //         child: ListView(
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.all(24.0),
        //               child: Column(
        //                 children: [
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text(
        //                         'Transactions',
        //                         style: TextStyle(
        //                           color: HexColor('E4E4F0'),
        //                           fontSize: 17,
        //                         ),
        //                       ),
        //                       Text(
        //                         'See all',
        //                         style: TextStyle(
        //                           fontSize: 17,
        //                           color: HexColor('7878FA'),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   const SizedBox(
        //                     height: 13,
        //                   ),
        //                   Column(
        //                     children: [
        //                       GestureDetector(
        //                         onTap: () {
        //                           Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                               builder: (context) => const PortFolio(),
        //                             ),
        //                           );
        //                         },
        //                         child: Container(
        //                             height: 95,
        //                             width: double.infinity,
        //                             decoration: BoxDecoration(
        //                               borderRadius: BorderRadius.circular(12),
        //                               color: HexColor('232336'),
        //                             ),
        //                             child: Padding(
        //                               padding: const EdgeInsets.all(12.0),
        //                               child: Row(
        //                                 mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                                 children: [
        //                                   Image.asset(
        //                                     'images/ADA 1.png',
        //                                     height: 32,
        //                                     width: 32,
        //                                   ),
        //                                   Column(
        //                                     mainAxisAlignment:
        //                                     MainAxisAlignment.spaceBetween,
        //                                     crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text(
        //                                         'Bought ADA',
        //                                         style: TextStyle(
        //                                           color: HexColor('E4E4F0'),
        //                                         ),
        //                                       ),
        //                                       Text(
        //                                         '\$${_cryptoPriceData['cardano']['usd'].toStringAsFixed(5)}',
        //                                         style: TextStyle(
        //                                           color: HexColor('E4E4F0'),
        //                                         ),
        //                                       ),
        //                                       Text(
        //                                         '30 Jul 2022, 3.30 PM',
        //                                         style: TextStyle(
        //                                           color: HexColor('A7A7CC'),
        //                                         ),
        //                                       ),
        //                                     ],
        //                                   ),
        //                                   const SizedBox(
        //                                     width: 20,
        //                                   ),
        //                                   Column(
        //                                     crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                     children: [
        //                                       Text(
        //                                         '+0.65 ETH',
        //                                         style: TextStyle(
        //                                           color: HexColor('E4E4F0'),
        //                                         ),
        //                                       ),
        //                                     ],
        //                                   ),
        //                                 ],
        //                               ),
        //                             )),
        //                       ),
        //                       const SizedBox(
        //                         height: 30,
        //                       ),
        //                       Row(
        //                         mainAxisAlignment:
        //                         MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           Text(
        //                             'Watchlist',
        //                             style: TextStyle(
        //                               color: HexColor('E4E4F0'),
        //                               fontSize: 17,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       const SizedBox(
        //                         height: 16,
        //                       ),
        //                       Container(
        //                           height: 73,
        //                           width: double.infinity,
        //                           decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(12),
        //                             color: HexColor('232336'),
        //                           ),
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(12.0),
        //                             child: Row(
        //                               mainAxisAlignment:
        //                               MainAxisAlignment.spaceBetween,
        //                               children: [
        //                                 Image.asset(
        //                                   'images/Bitcoin.png',
        //                                   height: 32,
        //                                   width: 32,
        //                                 ),
        //                                 Column(
        //                                   mainAxisAlignment:
        //                                   MainAxisAlignment.spaceBetween,
        //                                   crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                                   children: [
        //                                     Text(
        //                                       "Bitcoin",
        //                                       style: TextStyle(
        //                                         color: HexColor('E4E4F0'),
        //                                         fontSize: 17,
        //                                       ),
        //                                     ),
        //                                     // Text('-\$812.10', style: TextStyle(
        //                                     //   color: HexColor('A7A7CC'),
        //                                     // ),),
        //
        //                                     Text(
        //                                       'BTC',
        //                                       style: TextStyle(
        //                                         color: HexColor('A7A7CC'),
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                                 const SizedBox(
        //                                   width: 100,
        //                                 ),
        //                                 Column(
        //                                   crossAxisAlignment:
        //                                   CrossAxisAlignment.end,
        //                                   mainAxisAlignment:
        //                                   MainAxisAlignment.spaceBetween,
        //                                   children: [
        //                                     _isLoading
        //                                         ? CircularProgressIndicator(
        //                                       color:
        //                                       Colors.deepPurpleAccent,
        //                                     )
        //                                         : Text(
        //                                       '\$${_cryptoPriceData['bitcoin']['usd'].toStringAsFixed(2)}',
        //                                       style: TextStyle(
        //                                           fontSize: 14,
        //                                           color: Colors.white),
        //                                     ),
        //                                     Row(
        //                                       // mainAxisAlignment: MainAxisAlignment.end,
        //                                       children: [
        //                                         Text(
        //                                           '+0.54%',
        //                                           style: TextStyle(
        //                                             color: HexColor('7878FA'),
        //                                           ),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ],
        //                             ),
        //                           )),
        //                       const SizedBox(
        //                         height: 16,
        //                       ),
        //                       Container(
        //                           height: 73,
        //                           width: double.infinity,
        //                           decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(12),
        //                             color: HexColor('232336'),
        //                           ),
        //                           child: Padding(
        //                             padding: const EdgeInsets.all(12.0),
        //                             child: Row(
        //                               mainAxisAlignment:
        //                               MainAxisAlignment.spaceBetween,
        //                               children: [
        //                                 Image.asset(
        //                                   'images/Ethereum icon.png',
        //                                   height: 32,
        //                                   width: 32,
        //                                 ),
        //                                 Column(
        //                                   mainAxisAlignment:
        //                                   MainAxisAlignment.spaceBetween,
        //                                   crossAxisAlignment:
        //                                   CrossAxisAlignment.start,
        //                                   children: [
        //                                     Text(
        //                                       'Ethereum',
        //                                       style: TextStyle(
        //                                         color: HexColor('E4E4F0'),
        //                                         fontSize: 17,
        //                                       ),
        //                                     ),
        //                                     // Text('-\$812.10', style: TextStyle(
        //                                     //   color: HexColor('A7A7CC'),
        //                                     // ),),
        //
        //                                     Text(
        //                                       'ETH',
        //                                       style: TextStyle(
        //                                         color: HexColor('A7A7CC'),
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                                 const SizedBox(
        //                                   width: 100,
        //                                 ),
        //                                 Column(
        //                                   crossAxisAlignment:
        //                                   CrossAxisAlignment.end,
        //                                   mainAxisAlignment:
        //                                   MainAxisAlignment.spaceBetween,
        //                                   children: [
        //                                     Text(
        //                                       '\$${_cryptoPriceData['ethereum']['usd'].toStringAsFixed(2)}',
        //                                       style: TextStyle(
        //                                         color: HexColor('E4E4F0'),
        //                                       ),
        //                                     ),
        //                                     Row(
        //                                       children: [
        //                                         Text(
        //                                           '+0.54%',
        //                                           style: TextStyle(
        //                                             color: HexColor('7878FA'),
        //                                           ),
        //                                         ),
        //                                       ],
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ],
        //                             ),
        //                           )),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        bottomNavigationBar: GNav(
          // // rippleColor: Colors.grey, // tab button ripple color when pressed
          // // hoverColor: Colors.grey, // tab button hover color
          // haptic: true, // haptic feedback
          // tabBorderRadius: 15,
          //  tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
          //  tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
          //   tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration:
            const Duration(milliseconds: 900), // tab animation duration
            // // gap: 8, // the tab button gap between icon and text
            color: Colors.grey, // unselected icon color
            activeColor: Colors.purple, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
            Colors.purple.withOpacity(0.1), // selected tab background color
            // // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
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
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              print(index);
              setState(() {
                selectedIndex = index;

              });
            })

    );
  }
}
