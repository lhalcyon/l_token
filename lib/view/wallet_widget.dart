import 'package:flutter/material.dart';
import 'package:l_token/model/wallet.dart';
import 'package:l_token/util/wallet_util.dart';

class WalletWidget extends StatelessWidget {
  final HDWallet wallet;

  final VoidCallback onMoreTap;

  WalletWidget({this.wallet,this.onMoreTap});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
          color: theme.highlightColor),
      margin: new EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: [
              new Container(
                height: 36.0,
                width: 36.0,
                margin: EdgeInsets.only(top: 12.0, left: 16.0),
                foregroundDecoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                        image: new AssetImage(
                            'assets/images/ic_default_wallet_avatar_1.png'))),
              ),
              new Expanded(
                  child: new Container(
                margin: EdgeInsets.only(left: 8.0, top: 12.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: new Text(
                        wallet.name,
                        style: new TextStyle(color: Colors.white),
                      ),
                    ),
                    new Text(
                      WalletUtil.getShortAddress(wallet.address),
                      style: new TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              )),
              new Material(
                type: MaterialType.transparency,
                child: new InkWell(
                    borderRadius: BorderRadius.circular(48.0),
                    child: new Container(
                      padding: EdgeInsets.only(top: 12.0),
                      alignment: Alignment.topCenter,
                      height: 54.0,
                      width: 54.0,
                      child: new Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 22.0,
                      ),
                    ),
                    onTap: () {
                      onMoreTap();
                    }),
              ),
            ],
          ),
          new Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  '\$',
                  style: TextStyle(color: Colors.white),
                ),
                new Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: new Text('55.28',
                      style: TextStyle(color: Colors.white, fontSize: 24.0)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
