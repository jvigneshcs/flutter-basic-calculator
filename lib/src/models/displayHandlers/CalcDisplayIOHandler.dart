import 'package:calculator/src/abstracts/CalcDisplayIOHandleable.dart';
import 'package:calculator/src/abstracts/CalcDisplayable.dart';
import 'package:calculator/src/models/enums/InputType.dart';

class CalcDisplayIOHandler implements CalcDisplayIOHandleable {

  CalcDisplayIOHandler({required CalcDisplayable display}) :
        this._calcDisplay = display;

  @override
  InputType currentInputType = InputType.firstNumber;

  CalcDisplayable _calcDisplay;

  @override
  didTapNumber(int number) {
    switch (this.currentInputType) {
      case InputType.firstNumber:
        String text = this._calcDisplay.getText();
        if (text == '0') {
          this._calcDisplay.setText(number.toString());
          break;
        } else {
          continue secondNumber;
        }
        secondNumber:
      case InputType.secondNumber:
        String text = this._calcDisplay.getText();
        text += number.toString();
        this._calcDisplay.setText(text);
        break;
      case InputType.result:
        break;
      case InputType.operator:
        break;
    }
  }

  @override
  didTapOperator() {
    // TODO: implement didTapOperator
    throw UnimplementedError();
  }

  @override
  didTapDot() {
    // TODO: implement didTapDot
    throw UnimplementedError();
  }

  @override
  didTapEqualTo() {
    // TODO: implement didTapEqualTo
    throw UnimplementedError();
  }
}