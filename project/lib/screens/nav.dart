import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project/wallet/portfolio.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../profile/profile_page.dart';
import '../wallet/main_wallet_dashbaord.dart';
import '../wallet/wallet_deposit.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

int selectedIndex = 0;

const List<Widget> _pageOptions = <Widget>[
  SecondRoute(),
  WalletDeposit(),
  PortFolio(),
  ProfilePage(),
];

class _NavPageState extends State<NavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: _pageOptions.elementAt(selectedIndex),
        bottomNavigationBar: selectedIndex == 3
            ? null
            : GNav(
                // // rippleColor: Colors.grey, // tab button ripple color when pressed
                // // hoverColor: Colors.grey, // tab button hover color
                haptic: true, // haptic feedback
                // tabBorderRadius: 15,
                //  tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
                //  tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
                //   tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
                curve: Curves.easeOutExpo, // tab animation curves
                duration:
                    const Duration(milliseconds: 00), // tab animation duration
                // // gap: 8, // the tab button gap between icon and text
                color: Colors.grey, // unselected icon color
                activeColor: Colors.purple, // selected icon and text color
                iconSize: 24, // tab button icon size
                tabBackgroundColor: Colors.purple
                    .withOpacity(0.1), // selected tab background color
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

                  setState(() {
                    selectedIndex = index;
                  });
                }));
  }
}
