import 'package:flutter/material.dart';

import '../../constants/palette.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextOverflow? overflow;
  final double? size;
  final double? height;
  final int? maxLine;
  final String? family;
  final bool? isBold;
  final TextStyle? style;
  final Locale? locale;
  final FontWeight? weight;
  final TextAlign? align;

  const AppText(this.text,
      {Key? key,
      this.color,
      this.overflow,
      this.size,
      this.weight,
      this.align,
      this.maxLine,
      this.locale,
      this.height,
      this.family,
      this.style,
      this.isBold
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style??TextStyle(
        color: color??const Color(0xFFF2F2FA),
        fontSize: size ?? 15,
        fontFamily: family ?? 'Inter',
        height: height,
        fontWeight: weight ?? (isBold==true? FontWeight.w700:null),
      ),
      textAlign: align ?? TextAlign.start,
      selectionColor: AppColors.secondary.withOpacity(0.5),
      maxLines: maxLine,
    );
  }
}