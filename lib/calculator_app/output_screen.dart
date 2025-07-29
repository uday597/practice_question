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
    final cal = Provider.of<CalculatorProvider>(context).operations;
    return Scaffold(
      appBar: AppBar(
        title: Text('Output'),
        backgroundColor: const Color.fromARGB(255, 255, 249, 196),
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(170, 44, 2, 87),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cal.length,
              itemBuilder: (context, index) {
                final data = cal[index];
                return Card(child: ListTile(title: Text(data)));
              },
            ),
          ),
        ],
      ),
    );
  }
}
