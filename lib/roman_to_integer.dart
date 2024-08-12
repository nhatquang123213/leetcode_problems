import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RomanToInteger extends StatefulWidget {
  RomanToInteger({super.key});

  @override
  State<RomanToInteger> createState() => _RomanToIntegerState();
}

class _RomanToIntegerState extends State<RomanToInteger> {
  final _inputController = TextEditingController();
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Roman To Integer"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _inputController,
              decoration:
                  InputDecoration(hintText: "Please input right roman number"),
            ),
            GestureDetector(
              onTap: () => _romanToInteger(_inputController.text),
              child: Container(
                child: Text("Get Result"),
                width: 200,
                height: 36,
                color: Colors.blue,
              ),
            ),
            if (_result != 0) Text(_result.toString()),
          ],
        ),
      ),
    );
  }

  _romanToInteger(String s) {
    int result = 0;
    List<String> keys = ['I', 'V', 'X', 'L', 'C', 'D', 'M'];
    List<int> values = [1, 5, 10, 50, 100, 500, 1000];
    for (int i = 0; i <= s.length - 1; i++) {
      final index = keys.indexOf(s[i]);
      if (s.length > 1 && i < s.length - 1 && index < keys.indexOf(s[i + 1])) {
        result -= values[index];
      } else {
        result += values[index];
      }
    }
    setState(() {
      _result = result;
    });
  }
}
