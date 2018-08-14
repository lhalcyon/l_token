import 'package:flutter/material.dart';
import 'package:l_token/style/styles.dart';

enum BottomLineType {
  /// 无底线
  None,

  /// 有缺口的底线
  Gap
}

class ListItemWidget extends StatelessWidget {
  final IconData iconData;

  final String title;

  final String subTitle;

  final VoidCallback onTapCallback;

  final BottomLineType bottomLineType;

  final bool withArrow;

  ListItemWidget(
      {this.iconData,
      this.title,
      this.subTitle,
      this.onTapCallback,
      this.bottomLineType = BottomLineType.None,
      this.withArrow = true});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return new InkWell(
      onTap: onTapCallback,
      child: Stack(
        children: <Widget>[
          new Ink(
            height: Dimens.itemHeight,
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Padding(
                        padding: EdgeInsets.only(left: Dimens.padding),
                        child: new Icon(iconData, size: Dimens.itemIconSize)),
                    new Padding(
                      padding: EdgeInsets.only(left: Dimens.padding),
                      child: new Text(title),
                    ),
                  ],
                ),
                new Container(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(right: Dimens.padding),
                        child: new Text(subTitle??''),
                      ),
                      withArrow ?
                      new Padding(
                        padding: EdgeInsets.only(right: Dimens.padding),
                        child: new Icon(
                          Icons.keyboard_arrow_right,
                          size: Dimens.itemIconSize,
                        ),
                      ): Container()
                    ],
                  ),
                  alignment: Alignment.centerRight,
                )
              ],
            ),
          ),
          new Container(
            height: Dimens.itemHeight,
            alignment: Alignment.bottomCenter,
            child: new Padding(
              padding: EdgeInsets.only(left: Dimens.itemTitleLeading),
              child: new Divider(
                color: theme.backgroundColor,
                height: bottomLineType == BottomLineType.None ? 0.0 : Dimens.line,
              ),
            ),
          )
        ],
      ),
    );
  }
}
