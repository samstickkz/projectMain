import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/constants/palette.dart';
import 'package:project/routes/routes.dart';
import 'package:project/ui/widgets/apptexts.dart';
import 'package:project/utils/widget_extensions.dart';

import '../../constants/reuseables.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: onBoarding["data"]?.length,
        itemBuilder: (_, i)=> Container(
          height: height(context),
          width: width(context),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 77),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppImages.logoFull, height: 45, fit: BoxFit.contain,),
              Column(
                children: [
                  Image.asset(onBoarding["data"]![i]["svg"]!, height: width(context), fit: BoxFit.contain,),
                  40.0.sbH,
                  AppText(onBoarding["data"]![i]["content"]!, family: 'Space-Grotesk', size: 34, isBold: true,)
                ],
              ),
              SizedBox(
                height: 56,
                child: i==2?InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: ()=> navigationService.navigateToAndRemoveUntil(loginRoute),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: TextLiquidFill(
                        text: 'Get Started',
                        waveColor: Colors.white,
                        boxBackgroundColor: primaryColor,
                        textStyle: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                        boxHeight: 50.0,
                        loadDuration: const Duration(seconds: 10000),
                      ),
                    ),
                  ),
                ):IndicatorView(index: i),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class IndicatorView extends StatelessWidget {
  final int index;
  const IndicatorView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 24,
          width: index==0?44:24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: index==0? primaryColor:primaryColor.withOpacity(0.4)
          ),
        ),
        8.0.sbW,
        Container(
          height: 24,
          width: index==1?44:24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: index==1? primaryColor:primaryColor.withOpacity(0.4)
          ),
        ),
        8.0.sbW,
        Container(
          height: 24,
          width: index==2?44:24,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: index==2? primaryColor:primaryColor.withOpacity(0.4)
          ),
        ),
      ],
    );
  }
}

