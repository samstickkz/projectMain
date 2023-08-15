import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/constants/palette.dart';
import 'package:project/constants/reuseables.dart';
import 'package:project/ui/widgets/apptexts.dart';
import 'package:project/utils/widget_extensions.dart';

import '../../../base.ui.dart';
import '../../../widgets/appCard.dart';
import 'profile.home.vm.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileHomeViewModel>(
      onModelReady: (m)async {
        await m.addContext(context);
      },
      builder: (_, model, child)=> Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: Padding(
          padding: 16.0.padH,
          child: ListView(
            children: [
              AppCard(
                radius: 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          child: Image.network(model.userService.userCredentials.profilePhoto??"", height: 80, width: 80, fit: BoxFit.cover,),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ],
                    ),
                    10.0.sbW,
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText("Hi, ${model.userService.userCredentials.name}", isBold: true, size: 20,),
                                AppText("${model.userService.userCredentials.email}",  size: 15, color: Colors.white.withOpacity(0.5),),
                                10.0.sbH,
                                Row(
                                  children: [
                                    AppCard(
                                      backgroundColor: Colors.greenAccent.withOpacity(0.2),
                                      radius: 30,
                                      expandable: true,
                                      child: AppText("KYC Verified", color: Colors.lightGreenAccent,),
                                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    ),
                                    Expanded(child: SizedBox())
                                  ],
                                )
                              ],
                            ),
                          ),
                          10.0.sbW,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (){},
                                child: SvgPicture.asset(AppImages.pen, height: 24, width: 24,)
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
              20.0.sbH,
              const AppText("General", size: 15,),
              10.0.sbH,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: model.general.length,
                itemBuilder: (_,i)=> ProfileCard(svgImage: model.general[i].svgImage??"", title: model.general[i].title??"", onTap: model.general[i].onTap,)
              ),
              20.0.sbH,
              const AppText("Security", size: 15,),
              10.0.sbH,
              ProfileCard(svgImage: AppImages.passwordIcon, title: "Change Password", onTap: (){},),
              ProfileCard(svgImage: AppImages.twoFa, title: "Activate 2FA", onTap: (){},),
              ProfileCard(svgImage: AppImages.resetPassword, title: "Reset PIN", onTap: (){},),
              20.0.sbH,
              const AppText("Preferences", size: 15,),
              10.0.sbH,
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.preferences.length,
                  itemBuilder: (_,i)=> ProfileCard(svgImage: model.preferences[i].svgImage??"", title: model.preferences[i].title??"", onTap: model.preferences[i].onTap,)
              ),
              20.0.sbH,
              const AppText("Others", size: 15,),
              10.0.sbH,
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.others.length,
                  itemBuilder: (_,i)=> ProfileCard(svgImage: model.others[i].svgImage??"", title: model.others[i].title??"", onTap: model.others[i].onTap,)
              ),
              20.0.sbH,
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.account.length,
                  itemBuilder: (_,i)=> ProfileCard(svgImage: model.account[i].svgImage??"", title: model.account[i].title??"", onTap: model.account[i].onTap, isLogout: model.account[i].isLogout,)
              ),
              30.0.sbH
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String svgImage;
  final String title;
  final Widget? child;
  final VoidCallback? onTap;
  final bool? isLogout;
  const ProfileCard({
    super.key, required this.svgImage, required this.title,  this.child, this.onTap, this.isLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppCard(
          onTap: onTap,
          child: Row(
            children: [
              SvgPicture.asset(svgImage, color: isLogout==true? Colors.red:null,),
              16.0.sbW,
              Expanded(child: AppText(title, size: 17, weight: FontWeight.w700, maxLine: 1, overflow: TextOverflow.ellipsis, color: isLogout==true? Colors.red:null,)),
              16.0.sbW,
              child ?? Icon(Icons.arrow_forward_ios, size: 16,)
            ],
          ),
        ),
        10.0.sbH,
      ],
    );
  }
}
