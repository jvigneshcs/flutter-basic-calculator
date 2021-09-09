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
  setCalcDisplayable(CalcDisplayable displayable) {
    displayable.setText(this._calcDisplay.getText());
    this._calcDisplay = displayable;
  }

  @override
  didTapClear() {
    switch (this.currentInputType) {
      case InputType.firstNumber:
        if (this._canEditFirstNumber) {
          continue secondNumber;
        } else {
          break;
        }
        secondNumber:
      case InputType.secondNumber:
        String text = this._calcDisplay.getText();
        if (text.length > 1) {
          text = text.substring(0, text.length - 1);
          this._calcDisplay.setText(text);
        } else {
          this._calcDisplay.setText('0');
        }
        break;
      case InputType.operator:
        double number = this._firstNumber ?? 0;
        this._displayNumber(number);
        break;
      case InputType.result:
        break;
    }
  }

  @override
  didTapClearAll() {
    switch (this.currentInputType) {
      firstNumber:
      case InputType.firstNumber:
        this._firstNumber = null;
        this._calcDisplay.setText('0');
        break;
      case InputType.secondNumber:
      case InputType.result:
      case InputType.operator:
        this.currentInputType = InputType.firstNumber;
        this._secondNumber = null;
        continue firstNumber;
    }
  }

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
    if (operator == OperationType.percentage) {
      this._handlePercentageOperation();
    } else {
      this._handleOtherOperator(operator: operator);
    }
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
  didTapSwitchSign() {
    switch (this.currentInputType) {
      firstNumber:
      case InputType.firstNumber:
      case InputType.secondNumber:
        String text = this._calcDisplay.getText();
        if (text.startsWith('-')) {
          text = text.replaceFirst('-', '');
          this._calcDisplay.setText(text);
        } else {
          this._calcDisplay.setText('-' + text);
        }
        break;
      case InputType.result:
        this._firstNumber = this._firstNumber! * -1;
        continue firstNumber;
      case InputType.operator:
        break;
    }
  }

  @override
  didTapEqualTo() {
    switch (this.currentInputType) {
      case InputType.firstNumber:
        if (this._operationType != null) {
          double? input = this._getInputNumber();
          this._firstNumber = input;
          this._secondNumber = input;
          this._performOperation(operation: this._operationType!);
        }
        break;
      case InputType.secondNumber:
        if (this._operationType != null) {
          this._secondNumber = this._getInputNumber();
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

  double? _getInputNumber() {
    String text = this._calcDisplay.getText();
    return double.tryParse(text);
  }

  _handlePercentageOperation() {
    switch (this.currentInputType) {
      case InputType.firstNumber:
        this._firstNumber = this._getInputNumber();
        continue performOperation;
      case InputType.secondNumber:
        this.didTapEqualTo();
        continue performOperation;
        performOperation:
      case InputType.result:
      case InputType.operator:
        this._performOperation(operation: OperationType.percentage);
        break;
    }
  }

  _handleOtherOperator({required OperationType operator}) {
    switch (this.currentInputType) {
      case InputType.firstNumber:
        this._firstNumber = this._getInputNumber();
        this._calcDisplay.setText(operator.symbol);
        break;
      case InputType.secondNumber:
        this._secondNumber = this._getInputNumber();
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

  _performOperation({required OperationType operation}) {
    if (this._firstNumber == null ||
        (operation != OperationType.percentage && this._secondNumber == null)) {
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
      case OperationType.percentage:
        result = this._firstNumber! / 100;
        break;
    }

    this._firstNumber = result;
    this._canEditFirstNumber = false;
    this.currentInputType = InputType.result;
    this._displayNumber(result);
  }

  _displayNumber(double number) {
    NumberFormat formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    log('Max fraction digits - ${formatter.maximumFractionDigits}');
    this._calcDisplay.setText(formatter.format(number));
  }
}