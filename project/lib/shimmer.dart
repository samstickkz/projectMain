import 'package:flutter/material.dart';

class skeleton extends StatelessWidget {
  const skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white24.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
