import 'package:flutter/material.dart';

import 'package:practice_questions/providers/calculator_provider.dart';
import 'package:provider/provider.dart';

class OutputScreen extends StatefulWidget {
  const OutputScreen({super.key});

  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Output'),
        backgroundColor: const Color.fromARGB(255, 255, 249, 196),
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(170, 44, 2, 87),

      body: Consumer<CalculatorProvider>(
        builder: (context, value, child) {
          final cal = value.operations;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cal.length,
                  itemBuilder: (context, index) {
                    final data = cal[index];
                    return Card(
                      child: ListTile(
                        leading: IconButton(
                          onPressed: () {
                            value.removename(data);
                          },
                          icon: Icon(Icons.remove),
                        ),
                        title: Text(data),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                TextEditingController updatecontroller =
                                    TextEditingController();
                                return AlertDialog(
                                  title: Text('Edit Data'),
                                  content: TextField(
                                    controller: updatecontroller,
                                    decoration: InputDecoration(
                                      labelText: 'enter new data',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        final newvalue = updatecontroller.text;
                                        if (newvalue.isNotEmpty) {
                                          value.updatedata(index, newvalue);
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Text('Update'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
