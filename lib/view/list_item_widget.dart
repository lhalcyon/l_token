import 'package:flutter/material.dart';

enum LineType { None, Short, Whole }

class ListItemWidget extends StatelessWidget {
  final IconData iconData;

  final String title;

  final VoidCallback callback;

  final LineType lineType;

  ListItemWidget(
      {this.iconData,
      this.title,
      this.callback,
      this.lineType = LineType.None});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: callback,
      child: new Stack(
        children: <Widget>[
          new Container(
            height: 50.0,
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: new Icon(iconData, size: 22.0)),
                    new Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: new Text(title),
                    ),
                  ],
                ),
                new Container(
                  child: new Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: new Icon(
                      Icons.keyboard_arrow_right,
                      size: 22.0,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                )
              ],
            ),
          ),
          new Container(
            height: 50.0,
            alignment: Alignment.bottomCenter,
            child: new Padding(
              padding: EdgeInsets.only(
                  left: lineType == LineType.Whole ? 0.0 : 52.0),
              child: new Container(
//              color: const Color(0xFFF7F7F7),
                color: lineType == LineType.None
                    ? Colors.transparent
                    : const Color(0xFFF7F7F7),
                height: 1.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
