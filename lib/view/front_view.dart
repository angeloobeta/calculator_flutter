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
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text("Simple Calculator"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                      color: Colors.blueGrey,
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
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttons("7,8,9,/"),
                        buttons("4,5,6,x"),
                        buttons("1,2,3,+"),
                        buttons("0,.,-"),
                      ],
                    ))
              ],
            )));
  }

  Widget buttons(String str) {
    List<String> token = str.split(",");
    return Row(
      children: token
          .map(
            (_value) => Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextButton(
                      style: const ButtonStyle(),
                      child: Text(_value,
                          style: const TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                      onPressed: () {})),
            ),
          )
          .toList(),
    );
  }
}
