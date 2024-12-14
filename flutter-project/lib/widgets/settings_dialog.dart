import 'package:flutter/material.dart';

void showSettingsDialog(
    BuildContext context, Function(bool) showTermsCallback) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Settings'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              showTermsCallback(true);
            },
            child: const Text('利用規約'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Exit'),
          ),
        ],
      );
    },
  );
}
