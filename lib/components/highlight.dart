import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HighLight extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double radius;
  final double opacity;

  const HighLight({
    Key? key,
    this.radius = 6,
    this.opacity = 0.15,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  const HighLight.noRadius({
    Key? key,
    this.radius = 0,
    this.opacity = 0.15,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(radius),
              highlightColor: AppColors.black000000.withOpacity(opacity),
              focusColor: AppColors.black000000.withOpacity(opacity),
              hoverColor: AppColors.black000000.withOpacity(opacity),
              splashColor: Colors.transparent,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
