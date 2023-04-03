import 'package:flutter/material.dart';

Future<void> alertDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('خطا'),
        content: const SingleChildScrollView(
          child: Text('!پلاگین مورد استفاده شما معتبر نمیباشد'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
