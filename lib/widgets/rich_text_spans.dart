import 'package:chat_application/helper/bars.dart';
import 'package:flutter/material.dart';

class AuthPagesSwapping extends StatelessWidget {
  const AuthPagesSwapping({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });

  final String text1;
  final String text2;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            spanTextMethod(
              context,
              text: text1,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            spanTextMethod(
              context,
              text: text2,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class AcceptTermsTextSnap extends StatelessWidget {
  const AcceptTermsTextSnap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          spanTextMethod(context,
              text: 'By Signing Up, you agree to our\n',
              color: Theme.of(context).colorScheme.onSecondary),
          spanTextMethod(context,
              text: 'Terms of service',
              color: Theme.of(context).colorScheme.primary),
          spanTextMethod(context,
              text: ' and ', color: Theme.of(context).colorScheme.onSecondary),
          spanTextMethod(context,
              text: 'privacy policy',
              color: Theme.of(context).colorScheme.primary),
        ],
      ),
    );
  }
}
