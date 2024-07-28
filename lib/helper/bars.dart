import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

var appBar = AppBar(
  forceMaterialTransparency: true,
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(
        Iconsax.moon5,
        size: 24,
      ),
    ),
  ],
);

class WelcomeMess extends StatelessWidget {
  const WelcomeMess({
    super.key,
    this.toptext,
    this.bottomText,
  });

  final String? toptext;
  final String? bottomText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          toptext!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Text(
          bottomText!,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}

TextSpan spanTextMethod(BuildContext context, {String? text, Color? color}) {
  return TextSpan(
    text: text,
    style: TextStyle(
      fontSize: 16,
      color: color,
    ),
  );
}
