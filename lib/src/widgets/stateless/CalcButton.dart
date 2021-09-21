import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  CalcButton(
      {Key? key,
      required String title,
      required VoidCallback? onPressed,
      int flex = 1,
      ButtonStyle? style})
      : this._title = title,
        this._onPressed = onPressed,
        this._flex = flex,
        this._style = style,
        super(key: key);

  final String _title;
  final VoidCallback? _onPressed;
  final int _flex;
  final ButtonStyle? _style;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: this._flex,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: ElevatedButton(
            child: Text(
              this._title,
              style: Theme.of(context).textTheme.headline4,
            ),
            onPressed: this._onPressed,
            style: this._style,
          ),
        ));
  }
}
