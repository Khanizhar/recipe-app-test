import 'package:flutter/material.dart';

void showAppDialog({required BuildContext context, required String title}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Error!',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              ElevatedButton(
                onPressed: Navigator.of(context).pop,
                child: Text('OK'),
              )
            ],
          ),
        );
      });
}
