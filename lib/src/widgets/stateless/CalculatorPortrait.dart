import 'package:calculator/src/abstracts/CalcDisplayIOHandleable.dart';
import 'package:calculator/src/models/enums/OperationType.dart';
import 'package:calculator/src/models/sub_classes/MyThemeData.dart';
import 'package:flutter/material.dart';

import 'CalcButton.dart';
import 'CalcNumberButton.dart';
import 'CalcOperatorButton.dart';
import 'CalculatorWidget.dart';

class CalculatorPortrait extends CalculatorWidget {
  CalculatorPortrait({
    Key? key,
    required Widget displayContainer,
    required CalcDisplayIOHandleable ioHandler,
    required MyThemeData themeData,
  }) : super(
          key: key,
          displayContainer: displayContainer,
          ioHandler: ioHandler,
          themeData: themeData,
        );

  @override
  Widget build(BuildContext context) {
    final mode = this.themeMode(context: context);
    final contrastStyle = this.buttonContrastStyle(mode: mode);
    final secondaryStyle = this.buttonSecondaryStyle(mode: mode);
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: this.displayContainer,
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcButton(
                      title: 'C',
                      onPressed: () {
                        this.ioHandler.didTapClearAll();
                      },
                      style: secondaryStyle,
                    ),
                    CalcButton(
                      title: '+/-',
                      onPressed: () {
                        this.ioHandler.didTapSwitchSign();
                      },
                      style: secondaryStyle,
                    ),
                    CalcOperatorButton(
                      operator: OperationType.square,
                      ioHandler: this.ioHandler,
                      style: secondaryStyle,
                    ),
                    CalcOperatorButton(
                      operator: OperationType.percentage,
                      ioHandler: this.ioHandler,
                      style: secondaryStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcNumberButton(
                      number: 7,
                      ioHandler: this.ioHandler,
                    ),
                    CalcNumberButton(
                      number: 8,
                      ioHandler: this.ioHandler,
                    ),
                    CalcNumberButton(
                      number: 9,
                      ioHandler: this.ioHandler,
                    ),
                    CalcOperatorButton(
                      operator: OperationType.division,
                      ioHandler: this.ioHandler,
                      style: contrastStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcNumberButton(
                      number: 4,
                      ioHandler: this.ioHandler,
                    ),
                    CalcNumberButton(
                      number: 5,
                      ioHandler: this.ioHandler,
                    ),
                    CalcNumberButton(
                      number: 6,
                      ioHandler: this.ioHandler,
                    ),
                    CalcOperatorButton(
                      operator: OperationType.multiplication,
                      ioHandler: this.ioHandler,
                      style: contrastStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcNumberButton(
                      number: 1,
                      ioHandler: this.ioHandler,
                    ),
                    CalcNumberButton(
                      number: 2,
                      ioHandler: this.ioHandler,
                    ),
                    CalcNumberButton(
                      number: 3,
                      ioHandler: this.ioHandler,
                    ),
                    CalcOperatorButton(
                      operator: OperationType.subtraction,
                      ioHandler: this.ioHandler,
                      style: contrastStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcButton(
                      title: '.',
                      onPressed: () {
                        this.ioHandler.didTapDot();
                      },
                    ),
                    CalcNumberButton(
                      number: 0,
                      ioHandler: this.ioHandler,
                    ),
                    CalcButton(
                      title: '=',
                      onPressed: () {
                        this.ioHandler.didTapEqualTo();
                      },
                    ),
                    CalcOperatorButton(
                      operator: OperationType.addition,
                      ioHandler: this.ioHandler,
                      style: contrastStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
