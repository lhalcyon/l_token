import 'package:flutter/material.dart';

enum Status {
  Loading,
  Error,
  NetworkNotAvailable,
  Empty,
  Result,
}

class StatusWidget extends StatelessWidget {
  final Status status;

  final Widget widget;

  final bool needReload;

  final String message;

  StatusWidget(
      {@required this.status, @required this.widget, this.needReload = false,this.message});

  @override
  Widget build(BuildContext context) {
    Widget result;
    switch (status) {
      case Status.Loading:
        result = _buildLoadingView(context);
        break;
      case Status.Result:
        result = this.widget;
        break;
      case Status.Empty:
        result = _buildEmptyView(context);
        break;
      case Status.Error:
        result = _buildErrorView(context);
        break;
      case Status.NetworkNotAvailable:
        result = _buildNetworkErrorView(context);
        break;
    }
    return result;
  }

  Widget _buildEmptyView(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            Icons.info_outline,
            size: 72.0,
            color: theme.primaryColor,
          ),
          new Padding(
            padding: EdgeInsets.only(top: 6.0,bottom: 8.0),
            child: new Text('Empty'),
          ),
          needReload
              ? new RaisedButton(
                  onPressed: () {},
                  child: new Text('Tap to Reload'),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildLoadingView(BuildContext context) {
    return new Center(
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildErrorView(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            Icons.error_outline,
            size: 72.0,
            color: theme.primaryColor,
          ),
          new Padding(
            padding: EdgeInsets.only(top: 6.0,bottom: 8.0),
            child: new Text(this.message??'Error'),
          ),
          needReload
              ? new RaisedButton(
            onPressed: () {},
            child: new Text('Tap to Reload'),
          )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildNetworkErrorView(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            Icons.network_check,
            size: 72.0,
            color: theme.primaryColor,
          ),
          new Padding(
            padding: EdgeInsets.only(top: 6.0,bottom: 8.0),
            child: new Text('Network not available'),
          ),
          needReload
              ? new RaisedButton(
            onPressed: () {},
            child: new Text('Tap to Reload'),
          )
              : Container(),
        ],
      ),
    );
  }
}
