import 'package:flutter/material.dart';
import 'package:l_token/pages/routes/routes.dart';

class IdentityInitPage extends StatelessWidget {
  static const String routeName = Routes.main + '/init';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Theme(
        data: theme.copyWith(),
        child: new Container(
          color: Colors.yellow,
        ));
  }
}
