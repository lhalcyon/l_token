import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:l_token/config/actions.dart';
import 'package:l_token/config/states.dart';
import 'package:l_token/pages/routes/routes.dart';
import 'package:l_token/view/list/switch_list_item_widget.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = Routes.profile + "/settings";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return StoreBuilder<AppState>(
      builder: (context, store) {
        return Scaffold(
            appBar: AppBar(
              title: new Text('Settings'),
            ),
            body: new Container(
              width: double.infinity,
              color: theme.backgroundColor,
              child: new Column(children: <Widget>[
                new SwitchListItemWidget(
                  title: 'Theme Mode',
                  isChecked: !store.state.theme.isDark(),
                  valueChanged: (isChecked){
                    store.dispatch(Action.ChangeTheme);
                  },
                  onTapCallback: (){
                    store.dispatch(Action.ChangeTheme);
                  },
                ),
                new RaisedButton(onPressed: (){
                    _loadInfo();
                }, child: new Text('operate')),
                new RaisedButton(onPressed: (){
                  _loadInfo2();
                }, child: new Text('future api'))
              ],)
            ));
      }
    );
  }
  
  Future _getInfo() async {
//    await new Future.delayed(new Duration(milliseconds: 2000));
    return Future.delayed(Duration(milliseconds: 2000),(){
      return "heheada";
    });
  }

  Future _loadInfo() async{
    print("before:${new DateTime.now()}");
    print(await _getInfo());
    print("after:${new DateTime.now()}");
  }

  Future _loadInfo2() async {
    print("before2:${new DateTime.now()}");
    _getInfo().then((info){
      print(info);
    });
    print("after2:${new DateTime.now()}");
  }
}
