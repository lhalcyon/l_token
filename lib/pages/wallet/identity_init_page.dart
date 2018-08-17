import 'package:flutter/material.dart';
import 'package:l_token/pages/routes/routes.dart';

class IdentityInitPage extends StatelessWidget {

  static const String routeName = Routes.main + '/init';

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          width: double.infinity,
          height: 300.0,
          color: Colors.blue,
        )
      ],
    );
  }
}