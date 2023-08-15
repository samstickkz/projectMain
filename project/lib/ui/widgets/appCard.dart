import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/widget_extensions.dart';

class AppCard extends StatelessWidget {
  final Color? backgroundColor;
  final double? radius;
  final double? widths;
  final double? heights;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final Decoration? decoration;
  final VoidCallback? onTap;
  final bool? expandable;
  const AppCard({
    super.key, this.backgroundColor, this.radius, this.widths, this.heights, this.padding, this.margin, this.child, this.decoration, this.onTap, this.expandable,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius ?? 10),
      child: Container(
        height: heights,
        width: widths?? (expandable==true? null: width(context)),
        margin: margin,
        padding: padding?? const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: decoration?? ShapeDecoration(
          color: backgroundColor ?? Color(0xFF1A1A24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
        ),
        child: child,
      ),
    );
  }
}