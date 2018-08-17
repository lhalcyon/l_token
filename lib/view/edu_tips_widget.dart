import 'package:flutter/material.dart';
import 'package:l_token/style/styles.dart';

class EduTipsWidget extends StatelessWidget {

  final String title;

  final String link;


  EduTipsWidget({@required this.title, this.link});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      child: new Ink(
        decoration: new BoxDecoration(border: Border(top: BorderSide(color: Colors.transparent))),
        width: double.infinity,
        height: Dimens.itemHeight,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.event_note),
            new Padding(padding: EdgeInsets.only(left: 4.0),child: new Text(title),)
          ],
        ),
      ),
      onTap: (){

      },
    );
  }
}