import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:project/utils/widget_extensions.dart';

import 'constants/palette.dart';



class ShimmerPage extends StatefulWidget {
  final Color? color;
  const ShimmerPage({Key? key, this.color,
  }) : super(key: key);

  @override
  State<ShimmerPage> createState() => _ShimmerPageState();
}
int _index = 0;

class _ShimmerPageState extends State<ShimmerPage>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return SafeArea(
            child: Container(
              color: widget.color==null?Colors.white:widget.color,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height*0.3,
                      padding: EdgeInsets.symmetric(vertical: 10,),
                      child: Skeleton(),
                    ),
                    10.0.sbH,
                    Expanded(child: Skeleton()),
                    20.0.sbH
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

}

class ShimmerPatient extends StatefulWidget {
  const ShimmerPatient({Key? key,
  }) : super(key: key);

  @override
  State<ShimmerPatient> createState() => _ShimmerPatientState();
}

class _ShimmerPatientState extends State<ShimmerPatient>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return  Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  child: Skeleton(),
                ),
                10.0.sbW,
                Container(
                  width: 20,
                  height: 20,
                  child: Skeleton(),
                ),
                10.0.sbW,
                Container(
                  width: 20,
                  height: 20,
                  child: Skeleton(),
                )
              ],

            ),
          );
        }
    );
  }

}


class Skeleton extends StatefulWidget {
  const Skeleton({Key? key, this.height, this.width, this.color=Colors.grey}) : super(key: key);

  final double? height, width;
  final Color? color;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // *****************************dispose*********************  ***

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 16.0;

    return Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.all(defaultPadding / 2),
        decoration: radiusBoxDecoration(
          colors: [AppColors.blue, AppColors.skyBlue, Colors.purple, Colors.white],
          animation: _animation,
        )
    );
  }
}

class CircleSkeleton extends StatefulWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  State<CircleSkeleton> createState() => _CircleSkeletonState();
}

class _CircleSkeletonState extends State<CircleSkeleton> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // *****************************dispose*********************  ***

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: radiusBoxDecoration(
        radius: widget.size!,
        colors: [AppColors.blue, AppColors.skyBlue, Colors.purple, Colors.white],
        animation: _animation,
      ),
    );
  }
}

class ShimmerCard extends StatefulWidget {
  const ShimmerCard({Key? key,
  }) : super(key: key);

  @override
  State<ShimmerCard> createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<ShimmerCard>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return  Container(
            height: size.height,
            width: size.width,
            child: Skeleton(),
          );
        }
    );
  }

}



class ShimmerCart extends StatefulWidget {
  const ShimmerCart({Key? key,
  }) : super(key: key);

  @override
  State<ShimmerCart> createState() => _ShimmerCartState();
}

class _ShimmerCartState extends State<ShimmerCart>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return  Container(
            height: size.height,
            margin: EdgeInsets.only(left: 16,right: 16),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 10,
              itemBuilder: (_, index) {
                return
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    height: 160,
                    width: size.width,
                    child: Skeleton(),
                  );
              },
            ),
          );
        }
    );
  }

}


class ShimmerWallet extends StatefulWidget {
  const ShimmerWallet({Key? key,
  }) : super(key: key);

  @override
  State<ShimmerWallet> createState() => _ShimmerWalletState();
}

class _ShimmerWalletState extends State<ShimmerWallet>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return  Container(
            height: size.height,
            margin: EdgeInsets.only(left: 16,right: 16),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 10,
              itemBuilder: (_, index) {
                return
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    height: 50,
                    width: size.width,
                    child: Skeleton(),
                  );
              },
            ),
          );
        }
    );
  }

}
class ShimmerPharm extends StatefulWidget {
  const ShimmerPharm({Key? key,
  }) : super(key: key);

  @override
  State<ShimmerPharm> createState() => _ShimmerPharmState();
}

class _ShimmerPharmState extends State<ShimmerPharm>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return  Container(
            height: size.height,
            width: size.width,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 10,
              itemBuilder: (_, index) {
                return
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
                          height: 200,
                          width: 160,
                          child: Skeleton(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
                          height: 200,
                          width: 160,
                          child: Skeleton(),
                        ),
                      ),
                    ],
                  );
              },
            ),
          );
        }
    );
  }

}