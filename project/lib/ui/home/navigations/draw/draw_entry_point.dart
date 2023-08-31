import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/constants/palette.dart';
import 'package:project/constants/reuseables.dart';
import 'package:project/ui/base.ui.dart';
import 'package:project/ui/widgets/app_button.dart';
import 'package:project/ui/widgets/apptexts.dart';
import 'package:project/utils/widget_extensions.dart';

import 'draw_entry_point.vm.dart';

class DrawEntryPointScreen extends StatefulWidget {
  const DrawEntryPointScreen({Key? key}) : super(key: key);

  @override
  State<DrawEntryPointScreen> createState() => _DrawEntryPointScreenState();
}

class _DrawEntryPointScreenState extends State<DrawEntryPointScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<DrawEntryPointViewModel>(
      onModelReady: (model){
        model.controller = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
        );

        model.animation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: model.controller,
            curve: Curves.easeInOutBack, // Choose an appropriate curve for bouncing
          ),
        );

        model.controller.repeat(reverse: true);

        model.startConfetti();
      },
      onDisposeReady: (model){
        model.controller.dispose();
        model.confettiController.dispose();
      },
      builder: (_, model, child)=> Scaffold(
        appBar: AppBar(
          title: AppText("Raffle Draw", isBold: true, size: 18,),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                child: ConfettiWidget(
                  confettiController: model.confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  numberOfParticles: 20,
                  colors: [Colors.blue.withOpacity(0.2), primaryColor.withOpacity(0.2), Colors.purple.withOpacity(0.2), Colors.yellow.withOpacity(0.2), Colors.orange.withOpacity(0.2),],
                  shouldLoop: true, // Set to true for repeating animation
                ),
              ),
              Container(
                height: height(context),
                width: width(context),
                padding: 16.0.padH,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        60.0.sbH,
                        AnimatedBuilder(
                          animation: model.animation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(0.0, -10 * model.animation.value), // Adjust the offset value
                              child: child,
                            );
                          },
                          child: Image.asset(AppImages.dollarBags, height: 200, width: 200,),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText("Welcome to *Jackpot", isBold: true, size: 22, color: primaryColor, family: 'Space-Grotesk',),
                        AppText("Stand a chance of winning \$100,000by staking \$1 only",  size: 18,),
                      ],
                    ),
                    Column(
                      children: [
                        AppButton(onTap: (){},isGradient:true, text: "Get Started",),
                        16.0.sbH,
                        AppButton(onTap: (){},isTransparent:true, borderColor: primaryColor, textColor: primaryColor, text: "How It Works",),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
