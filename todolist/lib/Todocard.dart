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
    required this.task_status,
  });
  String title;
  bool status;

  final index;
  final task_status;

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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 42, 42, 42)),
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
                          cursorColor: Colors.white,
                          onSubmitted: editfunc,
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
                      "${widget.index + 1} -  ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 206, 206, 199),
                        fontSize: 20,
                      ),
                    ),
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
                        widget.task_status(widget.index);
                        myController.text = widget.title;
                      },
                      icon: widget.status
                          ? Icon(Icons.check, color: Colors.green[500])
                          : Icon(
                              Icons.close,
                              color: Colors.red,
                            )),
                ])));
  }
}
