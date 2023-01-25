import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        HexColor('6262D9'),
                        HexColor('9D62D9'),
                      ])),

              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 16, right: 16, bottom: 13),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu,color: HexColor('A7A7CC'),),

                        Text('Home', style: TextStyle(
                          color: HexColor('E4E4F0'),
                        ),),
                        SizedBox(width: 40,)
                      ],
                    ),
                    SizedBox(height: 33,),

                    Row(
                      children: [
                        Text('Your Balance', style: TextStyle(
                          color: HexColor('D5D5E0'),
                          fontSize: 22,
                        ),),
                      ],
                    ),

                    SizedBox(height: 4,),

                    Row(
                      children: [
                        Text('\$2600.50', style: TextStyle(
                          color: HexColor('D5D5E0'),
                          fontSize: 34,
                          fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),

                    SizedBox(height: 45,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            
                            
                             borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          width: 98.33,
                          height: 101,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 21),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.arrow_upward_outlined, color: HexColor('F2F2FA'),),
                                Text('Top Up', style: TextStyle(
                                  color: HexColor('F2F2FA'),
                                  fontSize: 15,
                                ),),

                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(


                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          width: 98.33,
                          height: 101,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 21),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.add, color: HexColor('F2F2FA'),),
                                Text('Buy', style: TextStyle(
                                  color: HexColor('F2F2FA'),
                                  fontSize: 15,
                                ),),

                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(


                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withOpacity(0.3),
                          ),
                          width: 98.33,
                          height: 101,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 21),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.minimize_rounded, color: HexColor('F2F2FA'),),
                                SizedBox(height: 5,),
                                Text('Top Up', style: TextStyle(
                                  color: HexColor('F2F2FA'),
                                  fontSize: 15,
                                ),),

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
                     Text('Transactions', style: TextStyle(
                       color: HexColor('E4E4F0'),
                       fontSize: 17,
                     ),),

                     Text('See all', style: TextStyle(
                       fontSize: 17,
                       color: HexColor('7878FA'),
                     ),),
                   ],

                 ),

                SizedBox(height: 13,),

                Expanded(
                  child: ListView(

                    children: [
                      Container(
                          height: 95,
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
                                Image.asset('images/Ethereum icon.png', height: 32, width: 32,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Bought ETH', style: TextStyle(
                                      color: HexColor('E4E4F0'),
                                    ),

                                    ),
                                    Text('-\$812.10', style: TextStyle(
                                      color: HexColor('A7A7CC'),
                                    ),),

                                    Text('30 Jul 2022, 3.30 PM', style: TextStyle(
                                      color: HexColor('A7A7CC'),
                                    ),),

                                  ],
                                ),

                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('+0.65 ETH', style: TextStyle(
                                      color: HexColor('E4E4F0'),
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          )

                      ),
                      SizedBox(height: 30,),




                      // Container(
                      //     height: 95,
                      //     width: double.infinity,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(12),
                      //       color: HexColor('232336'),
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(12.0),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Image.asset('images/Ethereum icon.png', height: 32, width: 32,),
                      //           Column(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text('Bought ETH', style: TextStyle(
                      //                 color: HexColor('E4E4F0'),
                      //               ),
                      //
                      //               ),
                      //               Text('-\$812.10', style: TextStyle(
                      //                 color: HexColor('A7A7CC'),
                      //               ),),
                      //
                      //               Text('30 Jul 2022, 3.30 PM', style: TextStyle(
                      //                 color: HexColor('A7A7CC'),
                      //               ),),
                      //
                      //             ],
                      //           ),
                      //
                      //           SizedBox(width: 20,),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text('+0.65 ETH', style: TextStyle(
                      //                 color: HexColor('E4E4F0'),
                      //               ),),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     )
                      //
                      // ),


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
