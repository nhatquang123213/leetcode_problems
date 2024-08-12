import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LongestCommonString extends StatefulWidget {
  LongestCommonString({super.key});

  @override
  State<LongestCommonString> createState() => _LongestCommonStringState();
}

class _LongestCommonStringState extends State<LongestCommonString> {
  final _inputController = TextEditingController();
  final List<String> data = [];
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Longest Common Prefix"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _inputController,
              decoration: InputDecoration(hintText: "Please input string"),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    data.add(_inputController.text);
                  }),
                  child: Container(
                    child: Text("Add String"),
                    width: 200,
                    height: 36,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    data.clear();
                  }),
                  child: Container(
                    child: Text("Reset Strings"),
                    width: 200,
                    height: 36,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => _getCommonPrefix(),
              child: Container(
                child: Text("Get Result"),
                padding: EdgeInsets.only(top: 20),
                width: 200,
                height: 36,
                color: Colors.red,
              ),
            ),
            Text(data.toString()),
            if (_result.isNotEmpty) Text(_result.toString()),
          ],
        ),
      ),
    );
  }

  _getCommonPrefix() {
    if (data.isEmpty) return;
    String result = "";
    while (true) {
      try {
        result += data.first[result.length];
        if (data.any((e) => !e.startsWith(result))) {
          result = result.substring(0, result.length - 1);
          break;
        }
      } catch (e) {
        break;
      }
    }
    setState(() {
      _result = result;
    });
  }
}
