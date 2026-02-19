import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.color,
    required this.text,
    required this.onTap,
  });
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final Widget text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(child: text),
      ),
    );
  }
}
