import 'dart:developer';

import 'package:calculator/src/abstracts/CalcDisplayIOHandleable.dart';
import 'package:calculator/src/abstracts/CalcDisplayable.dart';
import 'package:calculator/src/models/enums/InputType.dart';
import 'package:calculator/src/models/enums/OperationType.dart';
import 'package:intl/intl.dart';

class CalcDisplayIOHandler implements CalcDisplayIOHandleable {

  CalcDisplayIOHandler({required CalcDisplayable display}) :
        this._calcDisplay = display;

  @override
  InputType currentInputType = InputType.firstNumber;

  CalcDisplayable _calcDisplay;
  double? _firstNumber;
  double? _secondNumber;
  OperationType? _operationType;
  bool _canEditFirstNumber = true;

  @override
  didTapNumber({required int number}) {
    switch (this.currentInputType) {
      case InputType.firstNumber:
        String text = this._calcDisplay.getText();
        if (text == '0') {
          if (number != 0) {
            this._calcDisplay.setText(number.toString());
          }
          break;
        } else {
          continue secondNumber;
        }
        secondNumber:
      case InputType.secondNumber:
        String text = this._calcDisplay.getText();
        if (text == '0') {
          if (number != 0) {
            this._calcDisplay.setText(number.toString());
          }
          break;
        }
        text += number.toString();
        this._calcDisplay.setText(text);
        break;
      case InputType.result:
        this.currentInputType = InputType.firstNumber;
        this._calcDisplay.setText(number.toString());
        break;
      case InputType.operator:
        this.currentInputType = InputType.secondNumber;
        this._calcDisplay.setText(number.toString());
        break;
    }
  }

  @override
  didTapOperator({required OperationType operator}) {
    switch (this.currentInputType) {
      case InputType.firstNumber:
        String text = this._calcDisplay.getText();
        this._firstNumber = double.tryParse(text);
        this._calcDisplay.setText(operator.symbol);
        break;
      case InputType.secondNumber:
        String text = this._calcDisplay.getText();
        this._secondNumber = double.tryParse(text);
        this._performOperation(operation: operator);
        break;
      case InputType.result:
      case InputType.operator:
        this._calcDisplay.setText(operator.symbol);
        break;
    }
    this.currentInputType = InputType.operator;
    this._operationType = operator;
  }

  @override
  didTapDot() {
    switch (this.currentInputType) {
      case InputType.firstNumber:
      case InputType.secondNumber:
        String text = this._calcDisplay.getText();
        if (!text.contains('.')) {
          text += '.';
          this._calcDisplay.setText(text);
        }
        break;
      case InputType.result:
        this._firstNumber = null;
        this._secondNumber = null;
        this.currentInputType = InputType.firstNumber;
        this._canEditFirstNumber = true;
        this._operationType = null;
        this._calcDisplay.setText('0.');
        break;
      case InputType.operator:
        this._secondNumber = null;
        this.currentInputType = InputType.secondNumber;
        this._calcDisplay.setText('0.');
        break;
    }
  }

  @override
  didTapEqualTo() {
    switch (this.currentInputType) {
      case InputType.firstNumber:
        if (this._operationType != null) {
          String text = this._calcDisplay.getText();
          double? input = double.tryParse(text);
          this._firstNumber = input;
          this._secondNumber = input;
          this._performOperation(operation: this._operationType!);
        }
        break;
      case InputType.secondNumber:
        if (this._operationType != null) {
          String text = this._calcDisplay.getText();
          this._secondNumber = double.tryParse(text);
          this._performOperation(operation: this._operationType!);
        }
        break;
      case InputType.result:
      case InputType.operator:
        if (this._operationType != null) {
          this._performOperation(operation: this._operationType!);
        }
        break;
    }
  }

  _performOperation({required OperationType operation}) {
    if (this._firstNumber == null || this._secondNumber == null) {
      return;
    }

    double result;
    switch (operation) {
      case OperationType.addition:
        result = this._firstNumber! + this._secondNumber!;
        break;
      case OperationType.subtraction:
        result = this._firstNumber! - this._secondNumber!;
        break;
      case OperationType.multiplication:
        result = this._firstNumber! * this._secondNumber!;
        break;
      case OperationType.division:
        result = this._firstNumber! / this._secondNumber!;
        break;
    }
    NumberFormat formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    log('Max fraction digits - ${formatter.maximumFractionDigits}');

    this._firstNumber = result;
    this._canEditFirstNumber = false;
    this.currentInputType = InputType.result;
    this._calcDisplay.setText(formatter.format(result));
  }
}