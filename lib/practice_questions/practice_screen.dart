import 'package:flutter/material.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  List<String> buttons = [
    ...List.generate(10, (index) => '${index + 1}'),
    '+',
    '-',
    '*',
    '=',
    '/',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perform Methods', style: TextStyle(fontSize: 30)),
        backgroundColor: const Color.fromARGB(255, 85, 3, 4),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 246, 239, 177),
      body: Column(
        children: [
          SizedBox(height: 100),

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
                        controller: textcontroller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(labelText: 'Enter Values'),
                      ),
                    ),
                    SizedBox(height: 70),
                    Padding(
                      padding: const EdgeInsets.all(13),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,

                        children: List.generate(buttons.length, (index) {
                          return Column(
                            children: [
                              ElevatedButton(
                                onPressed: () => calculatedata(buttons[index]),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(90, 65),
                                ),
                                child: Center(
                                  child: Text(
                                    buttons[index],
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
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
