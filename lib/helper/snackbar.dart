import 'package:chat_application/helper/extensions.dart';
import 'package:flutter/material.dart';

void customScaffold(BuildContext context, {String? text, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Theme.of(context).colorScheme.error,
      content: Row(
        children: [
          const Icon(Icons.error, color: Colors.white),
          20.width,
          Expanded(
            child: Text(
              text.toString(),
              style: TextStyle(color: Theme.of(context).colorScheme.onError),
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          16.width,
        ],
      ),
      duration: const Duration(seconds: 3),
      showCloseIcon: true,
    ),
  );
}
