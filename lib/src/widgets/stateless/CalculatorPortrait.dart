import 'package:calculator/src/abstracts/CalcDisplayIOHandleable.dart';
import 'package:calculator/src/models/enums/OperationType.dart';
import 'package:calculator/src/models/sub_classes/MyThemeData.dart';
import 'package:flutter/material.dart';

import 'CalcButton.dart';
import 'CalcNumberButton.dart';
import 'CalcOperatorButton.dart';

class CalculatorPortrait extends StatelessWidget {
  CalculatorPortrait({
    Key? key,
    required Widget displayContainer,
    required CalcDisplayIOHandleable ioHandler,
    required MyThemeData themeData,
  })  : this._displayContainer = displayContainer,
        this._ioHandler = ioHandler,
        this._themeData = themeData,
        super(key: key);

  final Widget _displayContainer;
  final CalcDisplayIOHandleable _ioHandler;
  final MyThemeData _themeData;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final mode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    final contrastStyle = ElevatedButton.styleFrom(
      primary: this._themeData.primaryContrastColor(mode: mode),
    );
    final secondaryStyle = ElevatedButton.styleFrom(
      primary: this._themeData.secondaryColor(mode: mode),
    );
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: this._displayContainer,
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
                        this._ioHandler.didTapClearAll();
                      },
                      style: secondaryStyle,
                    ),
                    CalcButton(
                      title: '+/-',
                      onPressed: () {
                        this._ioHandler.didTapSwitchSign();
                      },
                      style: secondaryStyle,
                    ),
                    CalcOperatorButton(
                      operator: OperationType.square,
                      ioHandler: this._ioHandler,
                      style: secondaryStyle,
                    ),
                    CalcOperatorButton(
                      operator: OperationType.percentage,
                      ioHandler: this._ioHandler,
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
                      ioHandler: this._ioHandler,
                    ),
                    CalcNumberButton(
                      number: 8,
                      ioHandler: this._ioHandler,
                    ),
                    CalcNumberButton(
                      number: 9,
                      ioHandler: this._ioHandler,
                    ),
                    CalcOperatorButton(
                      operator: OperationType.division,
                      ioHandler: this._ioHandler,
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
                      ioHandler: this._ioHandler,
                    ),
                    CalcNumberButton(
                      number: 5,
                      ioHandler: this._ioHandler,
                    ),
                    CalcNumberButton(
                      number: 6,
                      ioHandler: this._ioHandler,
                    ),
                    CalcOperatorButton(
                      operator: OperationType.multiplication,
                      ioHandler: this._ioHandler,
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
                      ioHandler: this._ioHandler,
                    ),
                    CalcNumberButton(
                      number: 2,
                      ioHandler: this._ioHandler,
                    ),
                    CalcNumberButton(
                      number: 3,
                      ioHandler: this._ioHandler,
                    ),
                    CalcOperatorButton(
                      operator: OperationType.subtraction,
                      ioHandler: this._ioHandler,
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
                        this._ioHandler.didTapDot();
                      },
                    ),
                    CalcNumberButton(
                      number: 0,
                      ioHandler: this._ioHandler,
                    ),
                    CalcButton(
                      title: '=',
                      onPressed: () {
                        this._ioHandler.didTapEqualTo();
                      },
                    ),
                    CalcOperatorButton(
                      operator: OperationType.addition,
                      ioHandler: this._ioHandler,
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
