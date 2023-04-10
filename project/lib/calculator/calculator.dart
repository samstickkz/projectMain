import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

import '../screens/nav.dart';
import 'buttons.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

var userQuestion = '';
var userAnswer = '';

void navigateToNewScreen(BuildContext context) {
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => ()),
  // );
}

final List<String> buttons = [
  'C',
  'DEL',
  '%',
  '/',
  '9',
  '8',
  '7',
  'x',
  '6',
  '5',
  '4',
  '-',
  '3',
  '2',
  '1',
  '+',
  '0',
  '.',
  'News',
  '=',
];

bool isOperator(String x) {
  if (x == '%' ||
      x == 'BTC' ||
      x == '-' ||
      x == '/' ||
      x == 'x' ||
      x == '+' ||
      x == '=') {
    return true;
  }
  return false;
}

bool isBtn(String x) {
  if (x == 'News') {
    return true;
  }
  return false;
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NavPage(),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'BTC: \$26,000 ',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            userQuestion,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, right: 8),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '= $userAnswer',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return Buttons(
                      buttontapped: () {
                        setState(() {
                          if (buttons[index] == 'DEL') {
                            // Delete last item added
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          } else if (buttons[index] == 'C') {
                            // Clear everything
                            userQuestion = '';
                            userAnswer = '';
                          }  else if (buttons[index] == 'News') {
                            print('news');
                            navigateToNewScreen;
                          } else if (buttons[index] == '=') {
                            // Evaluate userQuestion
                            equalPressed();
                            if (userQuestion.isNotEmpty) {
                              // Evaluate expression
                              // ...
                              // Set userAnswer to result of evaluation
                            } else {
                              userAnswer = 'Clear';
                            }
                          } else {
                            userQuestion += buttons[index];
                          }
                        });
                      },
                      color: isOperator(buttons[index])
                          ? Colors.deepPurpleAccent
                          : isBtn(buttons[index])
                              ? Colors
                                  .green // Set color to green if button is 'News'
                              : Colors.deepPurpleAccent.shade100,
                      textColor: Colors.white,
                      buttonText: buttons[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
