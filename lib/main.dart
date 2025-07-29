import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:practice_questions/calculator_app/calculator_screen.dart';
import 'package:practice_questions/providers/calculator_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.openBox('DataBase');

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CalculatorProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PracticePage(),
    );
  }
}
