import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:practice_questions/calculator_app/output_screen.dart';
import 'package:practice_questions/providers/calculator_provider.dart';
import 'package:provider/provider.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  List<String> buttons = [
    'AC',
    '(',
    ')',
    '/',
    '+',
    '8',
    '9',
    '7',
    '6',
    '-',
    '5',
    '4',
    '3',
    '2',
    '*',
    '1',
    '0',
    '00',
    '.',
    '=',
  ];
  String userinput = '';
  TextEditingController textcontroller = TextEditingController();

  void calculatedata(String value) {
    setState(() {
      if (value == '=') {
        try {
          final expression = userinput;
          final result = calculate(expression);
          textcontroller.text = result.toString();
          userinput = result.toString();
        } catch (e) {
          textcontroller.text = 'error';
          userinput = '';
        }
      } else {
        userinput += value;
        textcontroller.text = userinput;
      }
      if (value == 'AC') {
        textcontroller.clear();
        userinput = '';
      }
    });
  }

  num calculate(String expression) {
    if (expression.contains('+')) {
      final parts = expression.split("+");
      return int.parse(parts[0]) + int.parse(parts[1]);
    } else if (expression.contains('/')) {
      final parts = expression.split("/");
      return int.parse(parts[0]) / int.parse(parts[1]);
    } else if (expression.contains('*')) {
      final parts = expression.split("*");
      return int.parse(parts[0]) * int.parse(parts[1]);
    } else if (expression.contains('-')) {
      final parts = expression.split("-");
      return int.parse(parts[0]) - int.parse(parts[1]);
    }
    {
      return 0;
    }
  }

  void savedata() {
    final data = textcontroller.text;
    final storage = Hive.box('DataBase');
    storage.put('input', data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 252, 254, 191),
        foregroundColor: const Color.fromARGB(255, 6, 6, 6),
      ),
      backgroundColor: const Color.fromARGB(170, 44, 2, 87),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),

                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        controller: textcontroller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),

                          labelText: 'Enter Values',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 5,

                        children: List.generate(buttons.length, (index) {
                          return Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  String value = buttons[index];
                                  calculatedata(value);
                                  savedata();
                                  if (value == '=') {
                                    Provider.of<CalculatorProvider>(
                                      context,
                                      listen: false,
                                    ).adddata(textcontroller.text);
                                  }
                                },

                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(70, 35),
                                ),
                                child: Center(
                                  child: Text(
                                    buttons[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OutputScreen(),
                          ),
                        );
                      },
                      child: Text('Go to ouput '),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
