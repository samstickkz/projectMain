import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/utils/widget_extensions.dart';

import '../../../../coinpage_api/coinpage.dart';
import '../../../../constants/palette.dart';
import '../../../../shimmer.dart';
import '../../../base.ui.dart';
import '../../../widgets/apptexts.dart';
import 'drawer/drawer.ui.dart';
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
        drawer: const Drawer(
          child: DrawerScreen(),
        ),
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
                        // buy button
                        HomeButtons(
                          onTap:  () => model.popBuyToken(context),
                          icon: Icons.arrow_upward_outlined,
                          title: 'Buy',
                        ),
                        HomeButtons(
                          onTap:  () => Get.to(() => const Bbal()),
                          icon: Icons.add,
                          title: 'Sell',
                        ),
                        HomeButtons(
                          onTap:  () {},
                          icon: Icons.minimize_rounded,
                          title: 'Top Up',
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
            20.0.sbH,
            Padding(
              padding: 16.0.padH,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText("Transactions", isBold: true,),
                  InkWell(
                    onTap: (){},
                    child: AppText("see all", isBold: true, color: primaryColor, size: 13,)
                  ),
                ],
              ),
            ),
            10.0.sbH,
            Container(
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              padding: 16.0.padA,
              decoration: BoxDecoration(
                  color: textFieldFillColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Image.asset('images/Ethereum icon.png', height: 26, width: 26,),
                  12.0.sbW,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText("Ethereum", family: 'Inter'),
                            AppText('ETH'.toUpperCase(), weight: FontWeight.w100, color: AppColors.descriptionTextColor, family: 'Inter'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            AppText('+0.54%', family: 'Inter', weight: FontWeight.w500, size: 17,),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            30.0.sbH,
            Padding(
              padding: 16.0.padH,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText("WatchList", isBold: true,),
                  InkWell(
                    onTap: (){},
                    child: AppText("see more", isBold: true, color: primaryColor, size: 13,)
                  ),
                ],
              ),
            ),
            10.0.sbH,
            StreamBuilder(
              stream: model.fetchCryptoPrice(),
              builder: (context, snapshot) {
                List<Map<String, dynamic>> coins = snapshot.data??[];
                return snapshot.data==null? const ListLoader(height: 70,): ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_,i){
                    Map<String, dynamic> coin = coins[i];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                      padding: 16.0.padA,
                      decoration: BoxDecoration(
                          color: textFieldFillColor,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        children: [
                          Image.network(coin["image"], height: 26, width: 26,),
                          12.0.sbW,
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(coin["name"], family: 'Inter'),
                                    AppText('${coin["symbol"]}'.toUpperCase(), weight: FontWeight.w100, color: AppColors.descriptionTextColor, family: 'Inter'),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AppText('\$${NumberFormat.decimalPattern().format(coin["current_price"])}', family: 'Inter', weight: FontWeight.w500, size: 17,),
                                    AppText("${coin['price_change_percentage_24h'].toStringAsFixed(2)}%".toUpperCase(), color: primaryColor, family: 'Inter'),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

class ListLoader extends StatelessWidget {
  final double? height;
  final int? count;
  const ListLoader({
    super.key, this.height, this.count,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: count ?? 10, physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, itemBuilder: (_,i)=> Column(children: [Container(height: height?? 130 , child: ShimmerCard()), 16.0.sbH],));
  }
}


class HomeButtons extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  const HomeButtons({
    super.key, required this.onTap, required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                icon,
                color: HexColor('F2F2FA'),
              ),
              Text(
                title,
                style: TextStyle(
                  color: HexColor('F2F2FA'),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
