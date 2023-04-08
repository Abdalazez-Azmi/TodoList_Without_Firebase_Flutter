// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_typing_uninitialized_variables, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:todolist/main.dart';

// ignore: must_be_immutable
class TodoCard extends StatefulWidget {
  TodoCard({
    required this.index,
    super.key,
    required this.status,
    required this.title,
  });
  String title;
  bool status;

  final index;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  final myController2 = TextEditingController();

  editfunc(title) {
    setState(() {
      title = myController2.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          myController2.text = "";
          showDialog(
              barrierColor: Color.fromARGB(255, 21, 21, 20),
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 130,
                    color: Color.fromARGB(255, 42, 42, 42),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Edit Task",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                        TextField(
                          autofocus: true,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Color.fromARGB(31, 255, 255, 255),
                          onSubmitted: (value) {
                            setState(() {
                              
                          widget.title = myController2.text;
                            Navigator.pop(context);
                            });
                          },
                          controller: myController2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    editfunc(myController2);
                                    Navigator.pop(context);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Edited Success .")));
                                    widget.title = myController2.text;
                                  });
                                },
                                child: Text("Edit")),
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
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 52, 50, 50),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.only(top: 25),
            height: 60,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    
                    Text(
                      "${widget.title}",
                      style: TextStyle(
                          color: Color.fromARGB(255, 206, 206, 199),
                          fontSize: 20,
                          decoration: widget.status
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ]),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          AllTasks[widget.index].status =
                              !AllTasks[widget.index].status;
               
                          AllTasks[widget.index].title =
                              myController2.text; //// need to fix
                        });
                      },
                      icon: AllTasks[widget.index].status
                          ? Icon(Icons.check, color: Colors.green[500])
                          : Icon(
                              Icons.close,
                              color: Colors.red,
                            )),
                ])));
  }
}
