import 'package:flutter/material.dart';
import 'package:l_token/style/styles.dart';

class SwitchListItemWidget extends StatelessWidget {
  final bool isChecked;

  final String title;

  final ValueChanged<bool> valueChanged;

  SwitchListItemWidget({this.isChecked, this.title,this.valueChanged});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: Dimens.itemHeight,
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Padding(padding: EdgeInsets.only(left: Dimens.padding),child: new Text(title),),
          new Padding(padding: EdgeInsets.only(right: Dimens.padding),child: new Switch(value: isChecked, onChanged: valueChanged))
        ],
      ),
    );
  }
}
