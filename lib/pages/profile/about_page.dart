import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              })
        ],
      ),
      body: new Container(
        child: new StatusWidget(status: status, widget: new Container(
          color: Colors.blue,
        )),
      ),
    );
  }
}
