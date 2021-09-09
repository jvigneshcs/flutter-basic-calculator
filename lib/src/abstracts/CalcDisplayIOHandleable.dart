import 'package:calculator/src/abstracts/CalcDisplayable.dart';
import 'package:calculator/src/models/enums/InputType.dart';
import 'package:calculator/src/models/enums/OperationType.dart';

abstract class CalcDisplayIOHandleable {
  InputType currentInputType = InputType.firstNumber;

  setCalcDisplayable(CalcDisplayable displayable);
  didTapNumber({required int number});
  didTapOperator({required OperationType operator});
  didTapDot();
  didTapSwitchSign();
  didTapClear();
  didTapClearAll();
  didTapEqualTo();
}