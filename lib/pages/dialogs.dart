import 'package:flutter/material.dart';

void showProgressDialog<T>(
    {BuildContext context,
    VoidCallback onBack,
    bool barrierDismissible = true}) {
  showDialog<T>(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      final ThemeData theme = Theme.of(context);
      return new Center(
          child: Container(
              width: 102.0,
              height: 102.0,
              decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: new Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new Align(
                    child: new Padding(
                      padding: EdgeInsets.only(top: 4.0, right: 4.0),
                      child: new GestureDetector(
                        child: Icon(Icons.cancel),
                        onTap: () {
                          Navigator.of(context).pop();
                          if (onBack != null){
                            onBack();
                          }
                        },
                      ),
                    ),
                    alignment: Alignment.topRight,
                  ),
                  new Padding(
                    padding: EdgeInsets.all(24.0),
                    child: new CircularProgressIndicator(),
                  )
                ],
              )));
    },
  ).then<void>((T value) {
    // The value passed to Navigator.pop() or null.
    if (value != null) {}
  });
}
