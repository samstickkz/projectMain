import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:project/utils/widget_extensions.dart';


Widget toast(String message, {bool? success}) {
  return
    Padding(
    padding: const EdgeInsets.all(20),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          width: double.infinity,
          height: 60.0,
          color:
          !success! ? Colors.red : Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    if (!success) const Icon(Icons.error_outline, color: Colors.white,
                      size: 24,),
                    10.0.sbW,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            message.toUpperCase(),
                            style: TextStyle(
                              color: !success ? Colors.white : Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// styled! ?:

showCustomToast(String message, {bool success = false, num? time}) {

  // toast message
  showToastWidget(
    toast(message, success: success),
    duration: const Duration(seconds: 3),
    onDismiss: () {},
  );
}