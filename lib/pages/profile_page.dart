import 'package:flutter/material.dart';
import 'package:l_token/pages/profile/settings_page.dart';
import 'package:l_token/pages/routes/routes.dart';
import 'package:l_token/pages/wallet/identity_init_page.dart';
import 'package:l_token/view/list/list_item_widget.dart';


class ProfilePage extends StatelessWidget {
  static const String routeName = Routes.profile + "/index";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var top = MediaQuery.of(context).padding.top;
    print(top);
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: theme.primaryColor,
          elevation: 0.0,
        ),
        body: new ListView(children: <Widget>[
          bodyAvatarAndNames(context),
          bodyItemsGroup(context),
          new Container(height: 20.0,),
          new ListItemWidget(iconData: Icons.settings,title: 'Settings',onTapCallback: (){
//            Navigator.of(context).pushNamed(SettingsPage.routeName);
          },),
          new InkResponse(
            radius: 50.0,
            child: Container(height:50.0,color: Colors.white,child: new Text('heheda'),),onTap: (){
            print('click');
          },),
          Divider(height: 20.0,),
          new Ink(height: 50.0,color: Colors.white,child: new InkWell(child: new Text('heheda'),onTap: (){
            Navigator.of(context).pushNamed(IdentityInitPage.routeName);
          },)),
          new ListTile(title: new Text('heheda'),onTap: (){

          },)
        ]));
  }

  Widget bodyAvatarAndNames(BuildContext context) {
    double top = MediaQuery.of(context).padding.top;
    final ThemeData theme = Theme.of(context);
    return new Container(
      height: 180.0 - top,
      color: theme.primaryColor,
      child: new Column(
//        mainAxisAlignment: MainAxisAlignment,
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

  Widget bodyItemsGroup(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
      height: 50.0,
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


}
