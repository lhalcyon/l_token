import 'package:flutter/material.dart';
import 'package:l_token/config/states.dart';
import 'package:l_token/config/themes.dart';
import 'package:l_token/pages/main_page.dart';
import 'package:l_token/pages/routes/page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  Store<AppState> store =
      new Store(appReducer, initialState: new AppState(theme: kLightTheme));
  runApp(new App(store: store));
}

class App extends StatelessWidget {
  final Store<AppState> store;

  App({this.store});

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new StoreBuilder<AppState>(builder: (context, store) {
          return new MaterialApp(
            theme: store.state.theme.themeData,
            routes: _buildRoutes(),
            home: new MainPage(),
          );
        })
    );
  }

  Map<String, WidgetBuilder> _buildRoutes() {
    return new Map<String, WidgetBuilder>.fromIterable(
      kAllPages,
      key: (dynamic page) => '${page.routeName}',
      value: (dynamic page) => page.buildRoute,
    );
  }
}
