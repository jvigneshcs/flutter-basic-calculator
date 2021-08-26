import 'package:calculator/src/abstracts/CalcDisplayIOHandleable.dart';
import 'package:calculator/src/models/displayHandlers/CalcDisplayIOHandler.dart';
import 'package:calculator/src/widgets/stateful/CalcDisplay.dart';
import 'package:calculator/src/widgets/stateless/CalcButton.dart';
import 'package:calculator/src/widgets/stateless/CalcNumberButton.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late CalcDisplay _display = CalcDisplay();
  late CalcDisplayIOHandleable _ioHandler = CalcDisplayIOHandler(display: this._display);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
              children: [
                Expanded(
                  flex: 1,
                    child: this._display,
                ),
                Expanded(
                  flex: 4,
                    child: Column(
                      children: [
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
                                CalcButton(
                                  title: '/',
                                  onPressed: _onTapButton,
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
                              CalcButton(
                                title: '×',
                                onPressed: _onTapButton,
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
                              CalcButton(
                                title: '-',
                                onPressed: _onTapButton,
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
                                onPressed: _onTapButton,
                              ),
                              CalcNumberButton(
                                number: 0,
                                ioHandler: this._ioHandler,
                              ),
                              CalcButton(
                                title: '=',
                                onPressed: _onTapButton,
                              ),
                              CalcButton(
                                title: '+',
                                onPressed: _onTapButton,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ),
              ],
          ),
        ),
      ),
    );
  }

  _onTapButton() {

  }
}