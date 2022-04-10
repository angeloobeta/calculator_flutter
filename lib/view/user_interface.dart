import 'package:flutter/material.dart';
import 'calcutator_button.dart';

class UserInterface extends StatefulWidget {
  const UserInterface({Key? key}) : super(key: key);

  @override
  _UserInterfaceState createState() => _UserInterfaceState();
}

class _UserInterfaceState extends State<UserInterface> {
  String inputString = " 20 + 25";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Calculator',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey.withOpacity(0.70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    inputString,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w800,
                        fontSize: 50),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [makeButton("AC,+/-,%,/")]),
                  Row(children: [makeButton("7,8,8,X")]),
                  Row(children: [makeButton("4,5,6,-")]),
                  Row(children: [makeButton("1,2,3,+")]),
                  Row(children: [makeButton("0,.,=")])
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget makeButton(String row) {
    List<String> token = row.split(",");
    return Expanded(
        child: Row(
      children: token.map((e) => CalculatorButton(keyValue: e)).toList(),
    ));
  }
}
