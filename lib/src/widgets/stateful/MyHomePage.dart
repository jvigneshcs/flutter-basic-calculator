import 'package:calculator/src/widgets/stateless/CalcButton.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
                    child: Container(
                      color: Colors.orangeAccent,
                    ),
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
                                    title: '7',
                                  onPressed: _onTapButton,
                                ),
                                CalcButton(
                                  title: '8',
                                  onPressed: _onTapButton,
                                ),
                                CalcButton(
                                  title: '9',
                                  onPressed: _onTapButton,
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
                              CalcButton(
                                title: '4',
                                onPressed: _onTapButton,
                              ),
                              CalcButton(
                                title: '5',
                                onPressed: _onTapButton,
                              ),
                              CalcButton(
                                title: '6',
                                onPressed: _onTapButton,
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
                              CalcButton(
                                title: '1',
                                onPressed: _onTapButton,
                              ),
                              CalcButton(
                                title: '2',
                                onPressed: _onTapButton,
                              ),
                              CalcButton(
                                title: '3',
                                onPressed: _onTapButton,
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
                              CalcButton(
                                title: '0',
                                onPressed: _onTapButton,
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