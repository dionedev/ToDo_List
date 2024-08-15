import 'package:flutter/material.dart';
import 'package:todo_app/components/task_card.dart';

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

  List<Task> toDoList = [];

  void addTask() {
    Task task = Task(taskController.text, '12345', false);
    setState(() {
      toDoList.add(task);
      taskController.clear();
    });
  }

  void updateTaskStatus(index, isDone) {
    setState(() {
      toDoList[index].isDone = isDone;
    });
  }

  void deleteTask(index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  itemBuilder: (BuildContext context, int index) {
                    Task task = toDoList[index];
                    return TaskCard(
                      name: task.name,
                      time: task.time,
                      isDone: task.isDone,
                      onChanged: (isDone) {
                        updateTaskStatus(index, isDone);
                      },
                      onDelete: () {
                        deleteTask(index);
                      },
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
                  GestureDetector(
                    onTap: () {
                      addTask();
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(10, 182, 171, 1),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(10, 182, 171, 0.5),
                            spreadRadius: 0.5,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
