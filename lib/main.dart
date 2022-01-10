import 'dart:io';

import 'package:calculator_app/ResultDisplay.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';
// import 'package:flutter/rendering.dart'
import './Button.dart';

void main() {
  // debugPaintSizeEnabled=true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(title: 'Flutter Calculator Page'),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _userInput = '';
  String _result = '0';
  Parser p = Parser();

  @override
  Widget build(BuildContext context) {
    void onTap(String label) {
      setState(() {
        stdout.writeln('setState');
        _userInput += label;
      });
    }

    void reset() {
      stdout.writeln('reset');
      setState(() {
        _userInput = '';
        _result = '0';
      });
    }

    void compute() {
      try {
        setState(() {
          Expression exp = p.parse(_userInput);
          ContextModel cm = ContextModel();
          double res = exp.evaluate(EvaluationType.REAL, cm);
          _result = res.toString();
        });
      } catch (e) {
        setState(() {
          _result = 'Incorrect formula.';
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          ResultDisplay(
            formula: _userInput,
            result: _result,
          ),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CalcButton('7', Colors.white, Colors.black, () => onTap('7')),
            CalcButton('8', Colors.white, Colors.black, () => onTap('8')),
            CalcButton('9', Colors.white, Colors.black, () => onTap('9')),
            CalcButton('/', Colors.orange[300]!, Colors.white, () => onTap('/')),
          ]),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CalcButton('4', Colors.white, Colors.black, () => onTap('4')),
            CalcButton('5', Colors.white, Colors.black, () => onTap('5')),
            CalcButton('6', Colors.white, Colors.black, () => onTap('6')),
            CalcButton('*', Colors.orange[300]!, Colors.white, () => onTap('*')),
          ]),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CalcButton('1', Colors.white, Colors.black, () => onTap('1')),
            CalcButton('2', Colors.white, Colors.black, () => onTap('2')),
            CalcButton('3', Colors.white, Colors.black, () => onTap('3')),
            CalcButton('+', Colors.orange[300]!, Colors.white, () => onTap('+')),
          ]),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CalcButton('0', Colors.white, Colors.black, () => onTap('0')),
            CalcButton('AC', Colors.blue[300]!, Colors.white, reset),
            CalcButton('=', Colors.white, Colors.black, () => compute()),
            CalcButton('-', Colors.orange[300]!, Colors.white, () => onTap('-')),
          ]),
        ],
      ),
    );
  }
}
