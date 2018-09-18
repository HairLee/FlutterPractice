import 'dart:async';
import 'package:flutter/material.dart';

class MessageDialog {
  BuildContext _context;
  String _title;
  String _message;
  bool _cancelable = true;
  List<DialogButton> _listButtons = [];

  static MessageDialog builder(BuildContext context) {
    return new MessageDialog(context);
  }

  MessageDialog(this._context);

  MessageDialog setTitle(String title) {
    this._title = title;
    return this;
  }

  MessageDialog setMessage(String message) {
    this._message = message;
    return this;
  }

  MessageDialog setCancelable(bool cancelable) {
    this._cancelable = cancelable;
    return this;
  }

  MessageDialog addActionButton(String title, Function action) {
    _listButtons.add(new DialogButton(title, action));
    return this;
  }

  Future<Null> show() async {
    return showDialog<Null>(
      context: _context,
      barrierDismissible: _cancelable, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: this._title != null ? new Text(_title) : null,
          content: this._message != null
              ? new SingleChildScrollView(
                  child: new Text(this._message),
                )
              : null,
          actions: _listButtons
              .map((b) => new FlatButton(
                  onPressed: b._action, child: new Text(b._title)))
              .toList(),
        );
      },
    );
  }
}

class DialogButton {
  String _title;
  Function _action;

  DialogButton(this._title, this._action);
}
