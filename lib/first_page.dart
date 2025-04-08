import 'dart:math';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Color color = Color.fromARGB(255, 0, 255, 0);
  int index = 0;
  String direction = "Vertical";
  List directions = [
    AlignmentDirectional.centerStart,
    AlignmentDirectional.centerEnd,
    AlignmentDirectional.bottomCenter,
    AlignmentDirectional.topCenter,
    AlignmentDirectional.bottomStart,
    AlignmentDirectional.topEnd,
    AlignmentDirectional.bottomEnd,
    AlignmentDirectional.topStart,
  ];
  void changeColor() {
    setState(() {
      color = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
    });
  }

  void changeDirection() {
    setState(() {
      //vertical begin: centerSart end: centerEnd
      //horizontal begin: bottomCenter end: topCenter
      //left-right begin: bottomStart end: topEnd
      //right-left begin: bottomEnd end: topStart'=

      if (index == (directions.length - 2)) {
        index = 0;
        direction = "Vertical";
        return;
      }
      index = index + 2;
      if (index == 0) {
        direction = "Vertical";
      } else if (index == 2) {
        direction = "Horizontal";
      } else if (index == 4) {
        direction = "Left-Right";
      } else {
        direction = "Right-Left";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, Colors.white, color],
            begin: directions[index],
            end: directions[index + 1],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () => changeColor(),
              child: Text(
                "Change Color",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Text(
              "Red: ${color.r.toStringAsFixed(2)} Green: ${color.g.toStringAsFixed(2)} Blue: ${color.b.toStringAsFixed(2)}",
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () => changeDirection(),
              child: Text(
                "Change Direction",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Text("Aligmnet:  $direction"),
          ],
        ),
      ),
    );
  }
}
