// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function myfunc;
  final int index;
  final Function delete;
  const TodoCard(
      {required this.vartitle,
      required this.myfunc,
      required this.delete,
      required this.index,
      required this.doneORnot});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myfunc(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(209, 224, 224, 0.2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(fontSize: 25,
                color: doneORnot?  Color.fromARGB(255, 30, 29, 29):Colors.white,
                decoration: doneORnot? TextDecoration.lineThrough :TextDecoration.none,
              ),
              ),
              Row(
                children: [
                  Icon(
                    color: doneORnot ? Colors.green : Colors.red,
                    size: 27,
                    doneORnot ? Icons.check : Icons.close,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(index);
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 25,
                    color: Color.fromARGB(255, 247, 191, 187),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
