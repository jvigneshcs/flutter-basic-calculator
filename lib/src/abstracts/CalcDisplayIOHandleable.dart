import 'package:calculator/src/models/enums/InputType.dart';

abstract class CalcDisplayIOHandleable {
  InputType currentInputType = InputType.firstNumber;

  didTapNumber(int number);
  didTapOperator();
  didTapDot();
  didTapEqualTo();
}