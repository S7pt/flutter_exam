import 'dart:math';
import 'package:exam/game_logic.dart';
import 'package:flutter/material.dart';

class ListGenerator extends StatefulWidget {
  const ListGenerator({Key? key}) : super(key: key);
  @override
  _ListGeneratorState createState() => _ListGeneratorState();
}

class _ListGeneratorState extends State<ListGenerator> {
  Random rnd = new Random();
  GameLogic logic = GameLogic();
  var booleanList;
  @override
  Widget build(BuildContext context) {
    var isLastChoiceCorrect = false;
    var count = rnd.nextInt(5) + 5;
    var components = [count];
    // ignore: deprecated_member_use
    List<bool> booleanList = List.generate(count, (index) => false);
    for (int i = 0; i < count; i++) {
      booleanList[i] = false;
    }
    logic.GenerateNewSpecialElement(count);
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return Column(children: [
              InkWell(
                child: Container(
                    color: booleanList[index] ? Colors.green : Colors.grey[600],
                    width: 200,
                    height: 100,
                    child: Center(
                      child: Text("Element " + (index + 1).toString()),
                    )),
                onTap: () {
                  if (logic.CheckForValidElement(index)) {
                    setState(() {
                      booleanList[index] = true;
                    });
                    logic.GenerateNewSpecialElement(count);
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(top: 30))
            ]);
          }),
    ));
  }
}
