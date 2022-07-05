import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function() datePicker;
  AdaptiveFlatButton(this.text, this.datePicker);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: datePicker)
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: datePicker);
  }
}
