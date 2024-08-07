// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
final  int allTodos;
final  int allcompleted;
  const Counter({super.key, required this.allTodos, required this.allcompleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        "$allcompleted/$allTodos",
        style: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, 
            color: allcompleted==allTodos? const Color.fromARGB(255, 115, 241, 180) :Colors.white,
            ),
      ),
    );
  }
}
