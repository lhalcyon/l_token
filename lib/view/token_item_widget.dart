import 'package:flutter/material.dart';
import 'package:l_token/model/assets.dart';
import 'package:l_token/style/styles.dart';

class TokenItemWidget extends StatelessWidget {
  final Assets _assets;

  TokenItemWidget(this._assets);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final tokenIconSize = 40.0;
    return new InkWell(
      child: new Ink(
        height: 72.0,
//        padding: new EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        child: new Stack(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(left: 16.0),
                  child: new Image.asset(
                    'assets/images/ic_transfer_eth_b.png',
                    height: tokenIconSize,
                    width: tokenIconSize,
                  ),
                ),
                new Expanded(
                  child: new Padding(padding: EdgeInsets.only(left: 8.0),child: new Text('0.01449'),)
                ),
                new Container(
                  padding: new EdgeInsets.only(right: 16.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new Text('0.01449'),
                      new Text('\$ 25.87')
                    ],
                  ),
                )
              ],
            ),
            new Container(
              child: Divider(
                  height: Dimens.line, indent: 16.0),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
      onTap: () {
        print('token');
      },
    );
  }
}
