import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceivePage extends StatelessWidget {

  final String _address;

  final String _avatar;

  ReceivePage.name(this._address, this._avatar);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _appBar(context),
      body: new Center(child: new QrImage(
        data: "1234567890",
        size: 200.0,
      ),),
    );
  }

  _appBar(BuildContext context) {
    return new AppBar(
      title: new Text('Receive'),
    );
  }
}