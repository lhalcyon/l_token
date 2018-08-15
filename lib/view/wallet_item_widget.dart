import 'package:flutter/material.dart';
import 'package:l_token/model/wallet.dart';

class WalletItemWidget extends StatelessWidget {
  final HDWallet _wallet;

  WalletItemWidget(this._wallet);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double avatarSize = 42.0;
    return new Dismissible(
      key: new ObjectKey(_wallet),
      direction: DismissDirection.horizontal,
      child: new Container(
          margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
          decoration: new BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: new Stack(
            children: <Widget>[
              new Container(
                alignment: Alignment.topLeft,
                child: new Container(
                  height: 16.0,
                  width: 16.0,
                  child: new _BookFolderMark(isChecked: true,),
                ),
              ),
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(
                        top: 12.0, bottom: 12.0, left: 16.0, right: 10.0),
                    child: new Container(
                      height: avatarSize,
                      width: avatarSize,
                      foregroundDecoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: new AssetImage(
                                  'assets/images/ic_default_wallet_avatar_7.png'))),
                    ),
                  ),
                  new Expanded(
                      child: new Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text('ETH-Wallet'),
                            new Text('0xljlkjsldfjwkjerlkwerwrwe')
                          ],
                        ),
                      )),
                  new Container(
                    height: 62.0,
                    padding: EdgeInsets.only(right: 4.0),
                    alignment: Alignment.topCenter,
                    child: new Material(
                      type: MaterialType.transparency,
                      child: new InkWell(
                          borderRadius: BorderRadius.circular(42.0),
                          child: new Container(
                            alignment: Alignment.center,
                            height: 36.0,
                            width: 36.0,
                            child: new Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                              size: 22.0,
                            ),
                          ),
                          onTap: () {
                            print('more');
                          }),
                    ),
                  ),
                ],
              )
            ],
          )),
      onDismissed: (direction) {
        Navigator.of(context).pushNamed('/profile/settings');
      },
      background: new Container(
          color: theme.primaryColor,
          child: const ListTile(
              leading:
              const Icon(Icons.delete, color: Colors.white, size: 36.0))),
      secondaryBackground: new Container(
          color: theme.primaryColor,
          child: const ListTile(
              trailing:
              const Icon(Icons.archive, color: Colors.white, size: 36.0))),
    );
  }
}

class _BookFolderMark extends StatelessWidget {
  final bool isChecked;

  final Color backGroundColor;

  _BookFolderMark(
      {this.isChecked = false, this.backGroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    final double markerSize = 14.0;
    return isChecked
        ? new Stack(
      children: <Widget>[
        new Container(color: Colors.transparent, child: new ClipPath(
          clipper: new _TriangleCliper(radius: markerSize, isLeftPart: true),
          child: new SizedBox(
            width: markerSize,
            height: markerSize,
            child: new Container(
              color: backGroundColor,
            ),
          ),
        ), ),
        new ClipPath(
          clipper: new _TriangleCliper(radius: markerSize, isLeftPart: false),
          child: new SizedBox(
            width: markerSize,
            height: markerSize,
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(topRight: new Radius.circular(0.0),bottomRight: new Radius.circular(8.0)),
                color: Color(0xFFDDD6DF),
              ),
            ),
          ),
        ),
//        new Container(color: Colors.yellow,)
      ],
    )
        : Container();
  }
}

class _TriangleCliper extends CustomClipper<Path> {
  final double radius;

  final bool isLeftPart;

  _TriangleCliper({this.radius, this.isLeftPart = true});

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = new Path();
    if (isLeftPart) {
      path.moveTo(0.0, 0.0);
      path.lineTo(radius, 0.0);
      path.lineTo(0.0, radius);
      path.lineTo(0.0, 0.0);
    } else {
      path.moveTo(radius, 0.0);
      path.lineTo(radius, radius);
      path.lineTo(0.0, radius);
      path.lineTo(radius, 0.0);
    }
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
