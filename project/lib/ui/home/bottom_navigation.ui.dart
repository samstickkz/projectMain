import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project/constants/reuseables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/palette.dart';
import '../base.ui.dart';
import 'bottom_navigation.vm.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen>  with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavigationViewModel>(
      onModelReady: (m) async {

        m.controller = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
        );

        m.animation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: m.controller,
            curve: Curves.easeInOutBack, // Choose an appropriate curve for bouncing
          ),
        );
        m.controller.repeat(reverse: true);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
        m.appCache.firstTimeKYC = true;
      },
      builder: (_, model, child) {
        return WillPopScope(
          onWillPop:()=> model.willPop(context),
          child: Stack(
            children: [
              Scaffold(
                  body: model.pages[model.currentIndex],
                  bottomNavigationBar: _BottomNavigationBar(
                    onItemSelected: model.changePage,
                  ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: AnimatedBuilder(
                        animation: model.animation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0.0, -6 * model.animation.value), // Adjust the offset value
                            child: child,
                          );
                        },
                        child: FloatingActionButton(
                        onPressed: model.navigateToDraw,
                        backgroundColor: primaryColor,
                        child: SvgPicture.asset(AppImages.stars, height: 24, width: 24, color: AppColors.black, fit: BoxFit.cover,),
                        ),
                      )
                  )
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key, required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {

  var selectedIndex = 0;

  void handleItemSelected(int index){
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavigationBarItem(
                  icon: LineIcons.home,
                  label: 'Home',
                  isSelected: (selectedIndex == 0),
                  index: 0,
                  onTap: handleItemSelected,
                ),
                _NavigationBarItem(
                  icon: LineIcons.wallet,
                  label: 'Loans',
                  isSelected: (selectedIndex == 1),
                  index: 1,
                  onTap: handleItemSelected,
                ),
                _NavigationBarItem(
                  icon: LineIcons.clipboardList,
                  label: 'Invest',
                  isSelected: (selectedIndex == 2),
                  index: 2,
                  onTap: handleItemSelected,
                ),
                _NavigationBarItem(
                  icon: LineIcons.user,
                  label: 'Account',
                  isSelected: (selectedIndex == 3),
                  index: 3,
                  onTap: handleItemSelected,
                ),
              ]
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  _NavigationBarItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.index,
    this.isSelected = false,
    required this.onTap
  }) : super(key: key);

  final String label;
  final IconData icon;
  final int index;
  final bool isSelected;
  ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          onTap(index);
        },
        child: SizedBox(
          height: 60,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(margin: const EdgeInsets.symmetric(horizontal: 15),height: 1.5, color: isSelected? primaryColor: Colors.transparent,),
              SizedBox(
                height: 58.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 40 ,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isSelected? primaryColor.withOpacity(0.15): Colors.transparent,
                        ),
                        child: Icon(icon,  size: 25, color: isSelected? primaryColor:Theme.of(context).disabledColor,)
                    ),
                    const SizedBox(height: 5,),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}