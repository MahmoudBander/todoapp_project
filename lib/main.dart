// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_to_list_in_spreads, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:todoapp_project/widgets/counter.dart';
import 'package:todoapp_project/widgets/todo_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TodoApp(),
    );
  }
}
// class for task(todo_card)
class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
// List of todos
  List allTasks = [
    Task(title: "publish Video ", status: true),
    Task(title: "call mom ", status: true),
    Task(title: "Gem ", status: true),
    Task(title: "call dad ", status: true),
  ];
// To change the state of the todo (completed or not completed) when click on the todo
  changestatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }
// To remove todo when clicking on "delete" icon  
  delete(clicdeletd) {
    setState(() {
      allTasks.remove(allTasks[clicdeletd]);
    });
  }
// To remove all todos when clicking on "delete" icon in the appBar
  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }
// To Add new todo when cilcking on "ADD" in the Dialog widget
  addnewtask() {
    setState(() {
      allTasks.add(Task(title: mycontroller.text, status: false));
    });
  }
// create controller to get the text inside the textfield  
  final mycontroller = TextEditingController();
  int calculatecompletedTasks() {
    int comletedTask = 0;
    allTasks.forEach((item) {
      if (item.status) {
        comletedTask++;
      }
    });
    return comletedTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(49, 52, 56, 0.988),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                deleteAll();
              },
              icon: Icon(Icons.delete_forever),
              iconSize: 35,
              color: Color.fromARGB(255, 241, 145, 139),
            )
          ],
          elevation: 0,
          backgroundColor: Color.fromRGBO(84, 91, 109, 1),
          title: Text(
            "TO DO APP",
            style: TextStyle(
                fontSize: 33, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Counter(
                allTodos: allTasks.length,
                allcompleted: calculatecompletedTasks(),
              ),
              Container(
                color: Color.fromARGB(255, 77, 85, 98),
                height: 550,
                child: ListView.builder(
                    itemCount: allTasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoCard(
                        vartitle: allTasks[index].title,
                        doneORnot: allTasks[index].status,
                        myfunc: changestatus,
                        index: index,
                        delete: delete,
                      );
                    }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                    child: Container(
                  padding: EdgeInsets.all(35),
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: mycontroller,
                        decoration: InputDecoration(labelText: "Add New Task"),
                        maxLength: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            addnewtask();
                            Navigator.pop(context);
                          },
                          child: Text("ADD"))
                    ],
                  ),
                ));
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
