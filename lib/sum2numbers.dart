class Node {
  int val;
  Node? next;
  Node([this.val = 0, this.next]);
}

void sumTwoNodes() {
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

  _sumTwoNodes(
    Node(9, Node(9, Node(9, Node(9)))),
    Node(
      9,
      Node(9, Node(9, Node(9, Node(9, Node(9, Node(9)))))),
    ),
  );
}
