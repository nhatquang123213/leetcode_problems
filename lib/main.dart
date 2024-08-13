import 'package:flutter/material.dart';
import 'package:testing1/longest_common_string.dart';
import 'package:testing1/roman_to_integer.dart';
import 'package:testing1/sum2numbers.dart';
import 'package:testing1/zigzag_conversion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'View for all submissions of leetcode'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _titleSection(
                "Roman To Integer",
                () => _onTap(RomanToInteger(), context),
              ),
              _titleSection(
                "Longest String Prefix",
                () => _onTap(LongestCommonString(), context),
              ),
              _titleSection(
                "ZigzagConversion",
                () => _onTap(ZigzagConversion(), context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _titleSection(String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        color: Colors.red,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(top: 2),
        child: Text(title),
      ),
    );
  }

  _onTap(Widget route, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}
