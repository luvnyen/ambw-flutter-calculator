import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:c14190033_calculator/result.dart';
import 'package:c14190033_calculator/history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'expressionulator by C14190033',
      home: CalculatorApp(),
    );
  }
}

const Color colorDark = Color(0xFF374352);
const Color colorLight = Color(0xFFe6eeff);

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

bool darkMode = true;
String expression = "0";
bool isOperator = false;
String calcRes = "";

Map<String, String> history = {};

class _CalculatorAppState extends State<CalculatorApp> {
  void _displaySnackbar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: Colors.redAccent,
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onButtonPressed(String value) {
    setState(() {
      List<String> operators = ["+", "-", "×", "÷", "^", "%", "."];

      if (value == "C") {
        expression = "0";
        isOperator = false;
      } else if (value == 'del') {
        expression.length > 1
            ? expression = expression.substring(0, expression.length - 1)
            : expression = "0";
      } else if (value == "=") {
        calcRes = expression;

        if (calcRes.contains("÷") || calcRes.contains("×")) {
          calcRes = calcRes.replaceAll("÷", "/");
          calcRes = calcRes.replaceAll("×", "*");
        }

        try {
          Parser p = Parser();
          Expression exp = p.parse(calcRes);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);

          eval.toString().contains(".0")
              ? calcRes = eval.toInt().toString()
              : calcRes = eval.toString();

          if (calcRes == expression) {
            _displaySnackbar("At least 2 numbers are required!");
          } else {
            if (history.isNotEmpty &&
                history.keys.last != expression &&
                history.values.last != calcRes) {
              history.addAll({expression: calcRes});
            } else if (history.isEmpty) {
              history.addAll({expression: calcRes});
            }

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Result(
                  res: calcRes,
                ),
              ),
            );
          }
        } catch (e) {
          _displaySnackbar("Oops, invalid format used!");
        }
      } else if (operators.contains(value) && isOperator == true) {
        expression += value;
        isOperator = false;
      } else if (!operators.contains(value)) {
        expression == "0" ? expression = value : expression += value;
        isOperator = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        darkMode ? darkMode = false : darkMode = true;
                      });
                    },
                    child: _switchMode(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          expression,
                          style: TextStyle(
                            fontSize: 30,
                            color: darkMode ? Colors.green : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => History(
                                history: history,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.history,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'History',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(
                        title: 'C',
                        textColor: darkMode ? Colors.redAccent : Colors.green,
                      ),
                      _buttonRounded(
                        title: '%',
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                      _buttonRounded(
                        title: '^',
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                      _buttonRounded(
                        title: '÷',
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '7'),
                      _buttonRounded(title: '8'),
                      _buttonRounded(title: '9'),
                      _buttonRounded(
                        title: '×',
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '4'),
                      _buttonRounded(title: '5'),
                      _buttonRounded(title: '6'),
                      _buttonRounded(
                        title: '-',
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '1'),
                      _buttonRounded(title: '2'),
                      _buttonRounded(title: '3'),
                      _buttonRounded(
                        title: '+',
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '0'),
                      _buttonRounded(title: '.'),
                      _buttonRounded(
                        title: 'del',
                        icon: Icons.backspace_outlined,
                        iconColor: darkMode ? Colors.redAccent : Colors.green,
                      ),
                      _buttonRounded(
                        title: '=',
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRounded({
    String title = 'null',
    double padding = 18,
    IconData icon = Icons.android,
    Color iconColor = Colors.grey,
    Color textColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: () {
        _onButtonPressed(title);
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: NewContainer(
          darkMode: darkMode,
          borderRadius: BorderRadius.circular(40),
          padding: EdgeInsets.all(padding),
          child: SizedBox(
            width: padding * 2,
            height: padding * 1.8,
            child: Center(
              child: title != 'null' && title != 'del'
                  ? Text(
                      title,
                      style: TextStyle(
                        color: textColor != Colors.grey
                            ? textColor
                            : darkMode
                                ? Colors.white
                                : Colors.black,
                        fontSize: 25,
                      ),
                    )
                  : Icon(
                      icon,
                      color: iconColor,
                      size: 25,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return NewContainer(
      darkMode: darkMode,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: darkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight_round,
              color: darkMode ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class NewContainer extends StatefulWidget {
  final bool darkMode;
  final Widget? child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const NewContainer({
    this.darkMode = false,
    this.child,
    this.borderRadius,
    this.padding,
  });

  @override
  State<NewContainer> createState() => _NewContainerState();
}

class _NewContainerState extends State<NewContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _isPressed = true);
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: darkMode ? colorDark : colorLight,
          borderRadius: widget.borderRadius,
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    color: darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
                    offset: const Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
        ),
        child: widget.child,
      ),
    );
  }
}
