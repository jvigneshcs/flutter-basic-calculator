import 'package:calculator/src/abstracts/CalcDisplayIOHandleable.dart';
import 'package:calculator/src/models/displayHandlers/CalcDisplayIOHandler.dart';
import 'package:calculator/src/widgets/stateful/CalcDisplay.dart';
import 'package:calculator/src/widgets/stateless/CalculatorLandscape.dart';
import 'package:calculator/src/widgets/stateless/CalculatorPortrait.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalcDisplayIOHandleable? _ioHandler;
  CalcDisplay? _currentDisplay;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) {
              this._handleIOHandler();
              if (orientation == Orientation.portrait) {
                return CalculatorPortrait(
                    displayContainer:
                        this._displayContainer(this._currentDisplay!),
                    ioHandler: this._ioHandler!);
              } else {
                return CalculatorLandscape(
                    displayContainer:
                        this._displayContainer(this._currentDisplay!),
                    ioHandler: this._ioHandler!);
              }
            },
          ),
        ),
      ),
    );
  }

  GestureDetector _displayContainer(CalcDisplay display) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! < 0) {
          this._ioHandler?.didTapClear();
        }
      },
      child: display,
    );
  }

  _handleIOHandler() {
    if (this._currentDisplay == null && this._ioHandler == null) {
      this._currentDisplay = CalcDisplay();
      this._ioHandler = CalcDisplayIOHandler(display: this._currentDisplay!);
    } else {
      this._currentDisplay = CalcDisplay(
        title: this._currentDisplay!.getText(),
      );
      this._ioHandler?.setCalcDisplayable(this._currentDisplay!);
    }
  }
}
