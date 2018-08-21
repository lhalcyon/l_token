import 'package:flutter/material.dart';
import 'package:l_token/pages/profile/settings_page.dart';
import 'package:l_token/pages/routes/routes.dart';
import 'package:l_token/pages/wallet/identity_init_page.dart';
import 'package:l_token/style/styles.dart';
import 'package:l_token/view/list/list_item_widget.dart';


class ProfilePage extends StatelessWidget {
  static const String routeName = Routes.profile + "/index";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }


  Widget _bodyItemsGroup(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      height: Dimens.itemHeight,
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Icon(Icons.library_books),
              new Padding(padding: EdgeInsets.only(left: 4.0),child: new Text('Address Book'),)
            ],
          ),
          new Row(
            children: <Widget>[
              new Icon(Icons.notifications),
              new Padding(padding: EdgeInsets.only(left: 4.0),child: new Text('Notifications'),)
            ],
          )
        ],
      ),
    );
  }

  _appBar(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new AppBar(
      brightness: Brightness.dark,
      backgroundColor: theme.primaryColor,
      elevation: 0.0,
    );
  }

  _body(BuildContext context) {
    return Column(
      children: <Widget>[
        _bodyAvatarAndNames(context),
        _bodyItemsGroup(context),
        Divider(height: Dimens.line,),
        Divider(color: Colors.transparent,height: Dimens.divider,),
        Divider(height: Dimens.line,),
        new ListItemWidget(iconData: Icons.settings,title: 'Settings',onTapCallback: (){
          Navigator.of(context).pushNamed(SettingsPage.routeName);
        },bottomLineType: BottomLineType.Gap,),
        new ListItemWidget(iconData: Icons.collections_bookmark,title: 'Support Center',onTapCallback: (){},bottomLineType: BottomLineType.Gap,),
        new ListItemWidget(iconData: Icons.home,title: 'About Us',onTapCallback: (){},bottomLineType: BottomLineType.None,),
      ],
    );
  }

  Widget _bodyAvatarAndNames(BuildContext context) {
    double top = MediaQuery.of(context).padding.top;
    final ThemeData theme = Theme.of(context);
    return new Container(
      height: 180.0 - top,
      alignment: Alignment.center,
      width: double.infinity,
      color: theme.primaryColor,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Image.asset(
            'assets/images/ic_default_user_avatar.png',
            width: 48.0,
            height: 48.0,
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: new Text(
              'identify_name',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }



}
