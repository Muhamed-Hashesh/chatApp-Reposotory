import 'package:chat_application/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.isAuthenticationMethod = false,
    this.logoSvgAsset,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.onTap,
  });

  final String title;
  final bool isAuthenticationMethod;
  final String? logoSvgAsset;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isAuthenticationMethod
                ? Row(
                    children: [
                      SvgPicture.asset(logoSvgAsset!, width: 24, height: 24),
                      10.width,
                    ],
                  )
                : 0.height,
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
