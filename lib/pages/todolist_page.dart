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
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDateController = TextEditingController();

  List<Task> toDoList = [];

  void addTask() {
    String taskName = taskNameController.text.trim();
    String taskDate = taskDateController.text.trim();

    if (taskName.isNotEmpty && taskDate.isNotEmpty) {
      Task task = Task(taskNameController.text, taskDateController.text, false);

      setState(() {
        toDoList.add(task);
        taskNameController.clear();
        taskDateController.clear();
      });
    } else {
      null;
    }
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
              const SizedBox(
                child: Column(
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              height: 340,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  const Text(
                                    'Nova Tarefa',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 24,
                                      bottom: 8,
                                    ),
                                    child: TextField(
                                      controller: taskNameController,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(37, 37, 37, 1),
                                        fontSize: 18,
                                      ),
                                      decoration: const InputDecoration(
                                        labelText: 'Tarefa',
                                        hintText: 'Digite o nome da tarefa',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  TextField(
                                    controller: taskDateController,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(37, 37, 37, 1),
                                      fontSize: 18,
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: 'Data',
                                      hintText: 'dd/mm',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            fixedSize: const Size(160, 46),
                                            foregroundColor:
                                                const Color.fromRGBO(
                                                    231, 67, 67, 1),
                                            side: const BorderSide(
                                              width: 1.2,
                                              color: Color.fromRGBO(
                                                  231, 67, 67, 1),
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              taskNameController.clear();
                                              taskDateController.clear();
                                            });
                                          },
                                          child: const Text('Cancelar'),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(160, 46),
                                          foregroundColor: Colors.white,
                                          backgroundColor: const Color.fromRGBO(
                                              10, 182, 171, 1),
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          addTask();
                                        },
                                        child: const Text('Adicionar'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(10, 182, 171, 1),
                        borderRadius: BorderRadius.circular(35),
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
