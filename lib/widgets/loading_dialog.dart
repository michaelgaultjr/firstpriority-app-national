import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final BuildContext context;

  LoadingDialog.show({
    @required this.context,
    Future<dynamic> Function() future,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => this,
    );

    if (future != null) {
      future().whenComplete(() => Navigator.of(context).pop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SimpleDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        children: [
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
