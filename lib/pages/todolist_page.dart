import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class Task {
  String name;
  String time;
  bool isDone;

  Task(this.name, this.time, this.isDone);
}

class _ToDoListPageState extends State<ToDoListPage> {
  TextEditingController taskController = TextEditingController();
  bool isChecked = true;
  List<Task> toDoList = [];

  addTask() {
    Task task = Task(taskController.text, '13:30', true);
    toDoList.add(task);
    taskController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(21, 21, 21, 1),
        appBar: AppBar(
          title: const Text(
            'Todo List',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          backgroundColor: const Color.fromRGBO(10, 182, 171, 1),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              iconSize: 27,
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, right: 24, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 27),
                        child: Text(
                          'March 4, 2024',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(125, 120, 120, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: toDoList.length,
                    itemBuilder: (BuildContext _, int index) {
                      return Container(
                        height: 60,
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(32, 31, 31, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                            Text(
                              toDoList[index].name,
                              style: TextStyle(
                                decoration: isChecked
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationColor:
                                    const Color.fromRGBO(122, 119, 119, 1),
                                decorationThickness: 2,
                                fontSize: 18,
                                color: const Color.fromRGBO(122, 119, 119, 1),
                              ),
                            ),
                            Text(
                              toDoList[index].time,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(122, 119, 119, 1),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        style: const TextStyle(
                          color: Color.fromRGBO(175, 174, 174, 1),
                          fontSize: 18,
                        ),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    FloatingActionButton.small(
                      onPressed: () {
                        addTask();
                        setState(() {});
                      },
                      child: const Text('+'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
