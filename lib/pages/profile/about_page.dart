import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:l_token/config/actions.dart';
import 'package:l_token/config/states.dart';
import 'package:l_token/pages/dialogs.dart';
import 'package:l_token/pages/routes/routes.dart';
import 'package:l_token/view/status_widget.dart';

class AboutPage extends StatefulWidget {
  static const String routeName = Routes.profile + '/about';

  @override
  State createState() {
    return new _AboutState();
  }
}

class _AboutState extends State<AboutPage> {
  Status status = Status.Loading;

  bool _needLoading = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(builder: (context, store) {
      return new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  var index = Status.values.indexOf(status);
                  index = (index + 1) % Status.values.length;
                  setState(() {
                    status = Status.values[index];
                  });
                }),
            new IconButton(
                icon: Icon(Icons.place),
                onPressed: () {
//                  store.dispatch(new LoadingAction(_needLoading));
//                  _needLoading = !_needLoading;
                    showProgressDialog(context: context);
                })
          ],
        ),
        body: new Container(
          child: new StatusWidget(
              status: status,
              widget: new Container(
                color: Colors.blue,
              )),
        ),
      );
    });
  }
}
