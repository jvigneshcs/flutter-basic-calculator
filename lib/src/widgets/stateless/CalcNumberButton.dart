import 'package:calculator/src/abstracts/CalcDisplayIOHandleable.dart';
import 'package:calculator/src/widgets/stateless/CalcButton.dart';
import 'package:flutter/material.dart';

class CalcNumberButton extends CalcButton {
  CalcNumberButton({
    Key? key,
    required int number,
    required CalcDisplayIOHandleable ioHandler,
    ButtonStyle? style,
  }) : super(
          key: key,
          title: number.toString(),
          onPressed: () {
            ioHandler.didTapNumber(number: number);
          },
          style: style,
        );
}
