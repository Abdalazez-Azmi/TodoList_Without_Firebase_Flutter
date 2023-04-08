// ignore_for_file: prefer_const_constructors, duplicate_ignore, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

/////
///All problems toggle true and false
//border reduis in showdialog

import 'package:flutter/material.dart';
import 'package:todolist/Todocard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class Tasks {
  String title;
  bool status;

  Tasks({
    required this.status,
    required this.title,
  });
}

List AllTasks = [
  // Tasks(status: true, title: "hack")
];

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

final myController = TextEditingController();

class _HomePageState extends State<HomePage> {
  myfunc() {
    setState(() {
      AllTasks.add(Tasks(status: false, title: myController.text));
    });
  }

  int completedTasks() {
    int completed = 0;
    AllTasks.forEach((element) {
      element.status ? completed++ : completed;
    });
    return completed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber[800],
          onPressed: () {
            myController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromARGB(255, 33, 33, 33)),
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Add Task",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                          TextField(
                            onSubmitted: (value) {
                              setState(() {
                                AllTasks.add(
                                    Tasks(status: false, title: value));
                                Navigator.pop(context);
                              });
                            },
                            autofocus: true,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            controller: myController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    myfunc();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            duration: Duration(seconds: 1),
                                            action: SnackBarAction(
                                                label: "dismiss",
                                                onPressed: () {}),
                                            backgroundColor: (Colors.black12),
                                            content: Text("1 Item Added .")));
                                  },
                                  child: Text(
                                    "Add Task",
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Icon(
            Icons.add,
            size: 25,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 10, 10, 10),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    AllTasks.removeRange(0, AllTasks.length);
                  });
                },
                icon: AllTasks.isEmpty
                    ? Icon(
                        Icons.delete_forever,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.delete_forever,
                        color: Colors.redAccent,
                      ))
          ],
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 5, 4, 4),
          title: Text("TodoList"),
        ),
        body: AllTasks.isEmpty
            ? Container(
                padding: EdgeInsets.all(9),
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Container(
                                      color: Color.fromARGB(255, 19, 19, 19),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 14),
                                      height: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Add Task",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white)),
                                          TextField(
                                            onSubmitted: (value) {
                                              setState(() {
                                                AllTasks.add(Tasks(
                                                    status: false,
                                                    title: value));
                                                Navigator.pop(context);
                                              });
                                            },
                                            autofocus: true,
                                            style:
                                                TextStyle(color: Colors.white),
                                            cursorColor: Color.fromARGB(
                                                31, 255, 255, 255),
                                            controller: myController,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    myfunc();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            duration: Duration(
                                                                seconds: 1),
                                                            action:
                                                                SnackBarAction(
                                                                    label:
                                                                        "dismiss",
                                                                    onPressed:
                                                                        () {}),
                                                            backgroundColor:
                                                                (Colors
                                                                    .black12),
                                                            content: Text(
                                                                "1 Item Added .")));
                                                  },
                                                  child: Text(
                                                    "Add Task",
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("Cancel"))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            padding: EdgeInsets.all(7),
                            color: Colors.amber,
                            child: Text(
                              "Add todo".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 54,
                                  color: Color.fromARGB(255, 252, 252, 252)),
                            ),
                          )),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "do everything to make your days success .",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Powerd by Abdalazez",
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 20),
                          ),
                        ],
                      )
                    ]))
            : Container(
                width: double.infinity,
                padding: EdgeInsets.all(7),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      completedTasks() == AllTasks.length &&
                              completedTasks() != 0
                          ? Text("List Completed Congarutions",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 247, 247, 247),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600))
                          : Text("${completedTasks()} / ${AllTasks.length}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 247, 247, 247),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600)),
                      SizedBox(
                          height: 500,
                          child: ListView.builder(
                              itemCount: AllTasks.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Dismissible(
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    setState(() {
                                      AllTasks.removeAt(index);
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      duration: Duration(seconds: 1),
                                      action: SnackBarAction(
                                          label: "dismiss", onPressed: () {}),
                                      content: Text(
                                          " Todo Number ${index + 1} was removed Successfully ."),
                                      backgroundColor: (Colors.black12),
                                    ));
                                  },
                                  child: TodoCard(
                                    index: index,
                                    status: AllTasks[index].status,
                                    title: AllTasks[index].title,
                                  ),
                                );
                              })),

                      //
                    ])));
  }
}
