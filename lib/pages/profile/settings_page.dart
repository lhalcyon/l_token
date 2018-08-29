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
    return StoreBuilder<AppState>(
      builder: (context, store) {
        return Scaffold(
            appBar: AppBar(
              title: new Text('Settings'),
            ),
            body: new Container(
              width: double.infinity,
              color: store.state.theme.themeData.primaryColor,
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
                new FlatButton(onPressed: (){

                }, child: new Text('operate'))
              ],)
            ));
      }
    );
  }
}
