import 'package:flutter/material.dart';

class FrontView extends StatefulWidget {
  const FrontView({Key? key}) : super(key: key);

  @override
  State<FrontView> createState() => _FrontViewState();
}

class _FrontViewState extends State<FrontView> {
  final String inputValue = "23 + 17";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Calculator')),
        body: Column(
          children: [
            Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.blueGrey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(inputValue,
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  )),
            ),
            Expanded(
                flex: 6,
                child: Column(
                  children: [buttons("1,2,3,+")],
                ))
          ],
        ));
  }

  Widget buttons(String str) {
    List<String> token = str.split(",");
    token.map((e) => Row());
    return Expanded(child: Row(children: token));
  }
}
