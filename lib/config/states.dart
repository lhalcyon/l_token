import 'package:l_token/style/themes.dart';
import 'package:l_token/redux/theme_redux.dart';
import 'package:l_token/redux/loading_redux.dart';

class AppState {
  final LTheme theme;

  final bool loadingVisible;

  AppState({this.theme, this.loadingVisible = false});
}

AppState appReducer(AppState state, action) {
  return AppState(
    theme: rThemeDataReducer(state.theme, action),
    loadingVisible: rLoadingReducer(state.loadingVisible, action),
  );
}
