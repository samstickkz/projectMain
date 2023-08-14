import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:project/utils/widget_extensions.dart';

import '../../../../constants/palette.dart';
import '../../../base.ui.dart';
import '../../../widgets/apptexts.dart';
import 'home.vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomePageViewModel>(
      builder: (_, model, child)=> Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  'Welcome ${model.userService.userCredentials.name??""}',
                ),
                16.0.sbW,
              ],
            ),
          ],
        ),
        drawer: Drawer(),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 16, right: 16, bottom: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.0.sbH,
                    Row(
                      children: [
                        const AppText('Your Balance', size: 22,),
                        16.0.sbW,
                        InkWell(
                          onTap: model.setAsHidden,
                          child: Icon(CupertinoIcons.eye)
                        )
                      ],
                    ),
                    4.0.sbH,
                    AppText('\$${model.userService.userCredentials.isHidden==true?"*******":"2600.50"}', size: 34, isBold: true,),
                    16.0.sbH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// top up button
                        GestureDetector(
                          onTap: () {
                            model.popBuyToken(context);
                            //show bottom sheet
                            // showModalBottomSheet(
                            //   elevation: 2,
                            //   isScrollControlled: true,
                            //   shape: const RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.only(
                            //       topLeft: Radius.circular(20),
                            //       topRight: Radius.circular(20),
                            //     ),
                            //   ),
                            //   context: context,
                            //   builder: (context) {
                            //     return Container(
                            //       height: 300,
                            //       color: Colors.black,
                            //       child: Column(
                            //         children: [
                            //           Container(
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //               BorderRadius.circular(10),
                            //               color: Colors.white,
                            //             ),
                            //             child: TextFormField(
                            //               keyboardType: TextInputType.number,
                            //               controller: ,
                            //               autovalidateMode: AutovalidateMode
                            //                   .onUserInteraction,
                            //               validator: (value) {
                            //                 if (value == null ||
                            //                     value.isEmpty) {
                            //                   return 'Please enter the amount';
                            //                 }
                            //                 return null;
                            //               },
                            //               decoration: const InputDecoration(
                            //                 iconColor: Colors.white,
                            //                 prefix: Text('NGN: '),
                            //                 hintText: 'Enter Amount',
                            //                 labelText: 'Amount',
                            //                 border: OutlineInputBorder(),
                            //               ),
                            //             ),
                            //           ),
                            //           Padding(
                            //             padding:
                            //             const EdgeInsets.only(top: 15.0),
                            //             child: Container(
                            //               decoration: BoxDecoration(
                            //                 borderRadius:
                            //                 BorderRadius.circular(10),
                            //                 color: Colors.white,
                            //               ),
                            //               child: TextFormField(
                            //                 controller: model.emailController,
                            //                 autovalidateMode: AutovalidateMode
                            //                     .onUserInteraction,
                            //                 validator: (value) {
                            //                   if (value == null ||
                            //                       value.isEmpty) {
                            //                     return 'Please enter the email';
                            //                   }
                            //                   return null;
                            //                 },
                            //                 decoration: const InputDecoration(
                            //                   hintText: 'example@gmail.com',
                            //                   labelText: 'Email',
                            //                   border: OutlineInputBorder(
                            //                       borderSide: BorderSide(
                            //                         color: Colors.black12,
                            //                       )),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //           Padding(
                            //             padding:
                            //             const EdgeInsets.only(top: 20.0),
                            //             child: ElevatedButton(
                            //               onPressed: () {
                            //                 model.makePayment(context);
                            //               },
                            //               child: const Text('Make Payment'),
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //     );
                            //   },
                            // );
                          },
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
                        ),

                        // buy button
                        GestureDetector(
                          onTap: () {
                            // Get.to(() => const Bbal());
                          },
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
                                    Icons.add,
                                    color: HexColor('F2F2FA'),
                                  ),
                                  Text(
                                    'Sell',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ),


                  ],
                ),
              ),
            ),
            20.0.sbH,
            Container(
              padding: 16.0.padA,
              decoration: BoxDecoration(
                color: textFieldFillColor,
                borderRadius: BorderRadius.circular(12)
              ),
            )
          ],
        ),
      ),
    );
  }
}
