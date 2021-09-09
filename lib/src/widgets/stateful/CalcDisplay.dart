import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/src/abstracts/CalcDisplayable.dart';
import 'package:flutter/material.dart';

class CalcDisplay extends StatefulWidget implements CalcDisplayable {
  CalcDisplay({Key? key, String title = '0'})
      : this._myState = _CalcDisplayState(title: title),
        super(key: key);

  final _CalcDisplayState _myState;

  @override
  _CalcDisplayState createState() => this._myState;

  @override
  String getText() {
    return this._myState.getText();
  }

  @override
  setText(String text) {
    this._myState.setText(text);
  }
}

class _CalcDisplayState extends State<CalcDisplay> implements CalcDisplayable {
  _CalcDisplayState({required String title})
      : this._title = title,
        super();

  String _title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.bottomRight,
        child: AutoSizeText(
          this._title,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.headline1,
          maxLines: 2,
        ),
      ),
    );
  }

  @override
  String getText() {
    return this._title;
  }

  @override
  setText(String text) {
    this.setState(() {
      this._title = text;
    });
  }
}
