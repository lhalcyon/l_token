import 'package:l_token/style/themes.dart';
import 'package:l_token/redux/theme_redux.dart';

class AppState {

  final LTheme theme;

  AppState({this.theme});

}

AppState appReducer(AppState state,action){
  return AppState(
      theme: rThemeDataReducer(state.theme,action)
  );
}