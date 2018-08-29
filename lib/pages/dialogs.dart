import 'package:flutter/material.dart';

void showProgressDialog<T>({BuildContext context, VoidCallback onBack}) {
  showDialog<T>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      final ThemeData theme = Theme.of(context);
      return new Container(
        width: 102.0,
        height: 102.0,
        decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: new Container(width: 48.0,height: 48.0,child: new CircularProgressIndicator(),)
      );
    },
  ).then<void>((T value) {
    // The value passed to Navigator.pop() or null.
    if (value != null) {
      onBack();
    }
  });
}
