import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    _sumTwoNodes(
      Node(9, Node(9, Node(9, Node(9)))),
      Node(
        9,
        Node(9, Node(9, Node(9, Node(9, Node(9, Node(9)))))),
      ),
    );
  }

  List<int> _nodeToArray(Node? node) {
    if (node == null) return [0];
    List<int> result = [];
    Node? temp = node;
    while (temp?.next != null) {
      result.add((temp?.val ?? 0));
      temp = temp?.next;
    }
    result.add((temp?.val ?? 0));
    return result;
  }

  List<int> _sumNumbersByArray(List<int> num1, List<int> num2) {
    num1 = List.from(num1.reversed);
    num2 = List.from(num2.reversed);

    if (num1.length < num2.length) {
      final temp = List.from(num1);
      num1 = List.from(num2);
      num2 = List.from(temp);
    }

    //make same length number to sum
    final addNumber = num1.length - num2.length;
    for (int i = 1; i <= addNumber; i++) {
      num2.insert(0, 0);
    }
    if (num1.length == num2.length) num1.insert(0, 0);

    //sum 2 units >10 => +1 for next unit
    bool greatThan10 = false;
    for (int i = num2.length - 1; i >= 0; i--) {
      final sumValueIndex = num1.length - 1 - (num2.length - 1 - i);
      final sumValue = (num1[sumValueIndex] + num2[i]) + (greatThan10 ? 1 : 0);
      greatThan10 = sumValue >= 10;
      num1[sumValueIndex] = sumValue % 10;
    }
    if (greatThan10) num1[0] = num1[0] + 1;
    if (num1[0] == 0) num1.removeAt(0);
    //
    num1 = num1.reversed.toList();
    return num1;
  }

  Node? _arrayToNode(List<int> array) {
    Node? newNode;
    for (var e in array.reversed) {
      newNode = Node(e, newNode);
    }
    return newNode;
  }

  Node? _sumTwoNodes(Node? l1, Node? l2) {
    return _arrayToNode(_sumNumbersByArray(_nodeToArray(l1), _nodeToArray(l2)));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Node {
  int val;
  Node? next;
  Node([this.val = 0, this.next]);
}
