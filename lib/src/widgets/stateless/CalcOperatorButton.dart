import 'package:calculator/src/abstracts/CalcDisplayIOHandleable.dart';
import 'package:calculator/src/models/enums/OperationType.dart';
import 'package:calculator/src/widgets/stateless/CalcButton.dart';
import 'package:flutter/material.dart';

class CalcOperatorButton extends CalcButton {
  CalcOperatorButton({Key? key, required OperationType operator, required CalcDisplayIOHandleable ioHandler}) :
        super(key: key, title: operator.symbol, onPressed: () {
          ioHandler.didTapOperator(operator: operator);
        });
}