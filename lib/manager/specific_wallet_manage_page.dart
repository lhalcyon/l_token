import 'package:flutter/material.dart';
import 'package:l_token/model/wallet.dart';
import 'package:l_token/pages/routes/routes.dart';
import 'package:l_token/style/styles.dart';
import 'package:l_token/view/list/list_item_widget.dart';

class SpecificWalletManagePage extends StatelessWidget {
//  static const String routeName = Routes.wallet + '/manage';

  final HDWallet wallet;

  SpecificWalletManagePage({this.wallet});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  _appBar(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new AppBar(
      brightness: theme.brightness,
      iconTheme: theme.iconTheme,
      backgroundColor: Colors.white,
      title: new Text(
        'Manage',
        style: new TextStyle(color: theme.primaryColor),
      ),
      bottom: new PreferredSize(
          child: Divider(
            height: Dimens.line,
            color: theme.dividerColor,
          ),
          preferredSize: new Size.fromHeight(Dimens.line)),
      elevation: 0.0,
      centerTitle: true,
    );
  }

  _body(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: <Widget>[
        _bodyWallet(context),
        Divider(
          color: theme.dividerColor,
          height: Dimens.line,
        ),
        Divider(
          height: Dimens.divider,
          color: Colors.transparent,
        ),
        Divider(
          color: theme.dividerColor,
          height: Dimens.line,
        ),
        new ListItemWidget(
          iconData: Icons.import_export,
          title: 'Export Mnemonic Phrase',
          onTapCallback: () {},
          bottomLineType: BottomLineType.Gap,
        ),
        new ListItemWidget(
          iconData: Icons.folder,
          title: 'Export Keystore',
          onTapCallback: () {},
          bottomLineType: BottomLineType.Gap,
        ),
        new ListItemWidget(
          iconData: Icons.vpn_key,
          title: 'Export Private Key',
          onTapCallback: () {},
          bottomLineType: BottomLineType.None,
        ),
      ],
    );
  }

  _bodyWallet(BuildContext context) {
    return new Ink(
      height: 80.0,
      color: Colors.white,
      child: new InkWell(
        onTap: () {},
        child: new Row(
          children: <Widget>[
            new Padding(padding: EdgeInsets.only(left: Dimens.padding),child: new Image.asset(
              'assets/images/ic_default_wallet_avatar_7.png',
              width: 48.0,
              height: 48.0,
            ),),
            new Expanded(
                child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text('ETH-Wallet'),
                new Text('0x...ejsldfjldjlsfj')
              ],
            )),
            new Padding(padding: EdgeInsets.only(right: Dimens.padding),child: new Icon(Icons.keyboard_arrow_right,size: Dimens.itemIconSize,),)
          ],
        ),
      ),
    );
  }
}
