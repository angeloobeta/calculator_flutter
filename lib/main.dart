import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserInterface(),
    );
  }
}

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
                  children: [Row(
                    makeButton("AC,+/-,%,/");
                    makeButton("7,8,8,X");
                    makeButton("4,5,6,-");
                    makeButton("1,2,3,+");
                    makeButton("0,.,=");
                  )],
                ),
              ),
            )
          ],
        ));
  }
}

Widget makeButton(String row) {
  List<String> token = [row.split(",")];
  return Expanded(
      child: Row(
    children: token.map((e) {
      CalculatorButton(keyValue: e)
    }).toList(),
  ));
}

class CalculatorButton extends StatelessWidget {
  final String keyValue;
  const CalculatorButton({Key? key, required this.keyValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FlatButton(
        shape: Border.all(
            color: Colors.white, width: 2.0, style: BorderStyle.solid),
        onPressed: () {},
        child: Text(
          keyValue,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
