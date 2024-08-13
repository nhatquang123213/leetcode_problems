import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZigzagConversion extends StatefulWidget {
  ZigzagConversion({super.key});

  @override
  State<ZigzagConversion> createState() => _ZigzagConversionState();
}

class _ZigzagConversionState extends State<ZigzagConversion> {
  final _inputController = TextEditingController();
  final _inputRowController = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zigzag Conversion"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _inputController,
              decoration: InputDecoration(hintText: "Please input string"),
            ),
            TextFormField(
              controller: _inputRowController,
              decoration:
                  InputDecoration(hintText: "Please input number of row"),
              keyboardType: TextInputType.number,
            ),
            GestureDetector(
              onTap: () => _toZigZacConversion(
                  _inputController.text, int.parse(_inputRowController.text)),
              child: Container(
                child: Text("Get Result"),
                width: 200,
                height: 36,
                color: Colors.blue,
              ),
            ),
            if (_result.isNotEmpty) Text(_result.toString()),
          ],
        ),
      ),
    );
  }

  _toZigZacConversion(String s, int row) {
    List<String> maps = [];

    String result = "";
    int x = 0;
    int y = 0;
    for (int i = 1; i <= row; i++) {
      maps.add("");
    }
    for (int i = 0; i <= s.length - 1; i++) {
      maps[y] += s[i];
      if (x % (row - 1) == 0 || x == 0) {
        if (y != row - 1) {
          y += 1;
        } else {
          x += 1;
          y -= 1;
        }
      } else {
        x += 1;
        y -= 1;
      }
    }
    for (int i = 0; i <= row - 1; i++) {
      result += maps[i];
    }
    setState(() {
      _result = result;
    });
  }
}
