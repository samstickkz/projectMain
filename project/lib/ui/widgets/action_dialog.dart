import 'package:flutter/material.dart';
import 'package:project/ui/widgets/apptexts.dart';
import 'package:project/utils/widget_extensions.dart';

import '../../constants/palette.dart';
import '../../constants/reuseables.dart';

class ActionBottomSheet extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ActionBottomSheet({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.of(context).pop(),
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){},
                child: Card(
                  child: Padding(
                    padding: 16.0.padA,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        20.0.sbH,
                        AppText(title, size: 20, weight: FontWeight.w700,),
                        15.0.sbH,
                        AppText("Are you sure you want to $title",),
                        30.0.sbH,
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.maxFinite,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor,
                                      padding: 15.0.padV,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  ),
                                  onPressed: onTap,
                                  child:  AppText(title, size: 16, weight: FontWeight.w700, color: Colors.white,),
                                ),
                              )
                            ),
                            16.0.sbW,
                            Expanded(
                              child: SizedBox(
                                width: double.maxFinite,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).cardColor,
                                      padding: EdgeInsets.symmetric(vertical: 15),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(side: BorderSide(width: 1.5, color: primaryColor),borderRadius: BorderRadius.circular(10))
                                  ),
                                  onPressed: ()=> navigationService.goBack(),
                                  child:  AppText("Cancel", size: 16, weight: FontWeight.w700, color: primaryColor),
                                ),
                              ),
                            )
                          ],
                        ),
                        20.0.sbH,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}