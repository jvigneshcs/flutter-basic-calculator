import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  CalcButton({Key? key, required String title, required VoidCallback? onPressed}):
        _title = title,
        _onPressed = onPressed,
        super(key: key);

  final String _title;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(2),
          child: ElevatedButton(
            child: Text(
              this._title,
              style: Theme.of(context).textTheme.headline4,
            ),
            onPressed: this._onPressed,
          ),
        )
    );
  }

}