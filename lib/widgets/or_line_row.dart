import 'package:flutter/material.dart';

class OrLine extends StatelessWidget {
  const OrLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'or continue with',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
