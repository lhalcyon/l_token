import 'package:flutter/material.dart';

class WalletCreateResultPage extends StatelessWidget {

  final String mnemonic;

  WalletCreateResultPage(this.mnemonic);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
        child: new RaisedButton(onPressed: (){

        },child: new Text('Backup'),),
    );
  }
}