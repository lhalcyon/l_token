import 'package:flutter/material.dart';
import 'package:l_token/pages/routes/routes.dart';

class WalletManagePage extends StatelessWidget {
  static const String routeName = Routes.wallet + '/manage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: new Container(),
    );
  }

  Widget _appBar(BuildContext context) {
    return new AppBar(
      title: new Stack(
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            child: new Container(
              width: 40.0,
              color: Colors.blue,
            ),
          ),
          new Container(
            alignment: Alignment.centerLeft,
            child: new Row(
              children: <Widget>[
                new Icon(Icons.timer),
                new Text('Records',style: TextStyle(fontSize: 14.0),)
              ],
            ),
          )
        ],
      ),
      actions: <Widget>[
        new IconButton(icon: new Icon(Icons.menu), onPressed: null)
      ],
      centerTitle: false,
      automaticallyImplyLeading: false,
    );
  }
}
