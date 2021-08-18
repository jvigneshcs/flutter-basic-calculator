import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  CalcButton({Key? key, required this.title, this.onPressed}): super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(2),
          child: ElevatedButton(
            child: Text(
              this.title,
              style: Theme.of(context).textTheme.headline4,
            ),
            onPressed: this.onPressed,
          ),
        )
    );
  }

}