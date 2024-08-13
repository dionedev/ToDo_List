import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String name;
  final String time;
  final bool isDone;

  const TaskCard(
      {super.key, required this.name, required this.time, this.isDone = false});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 14),
      height: 60,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(32, 31, 31, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: widget.isDone,
                onChanged: (value) {
                  setState(() {});
                },
              ),
              Text(
                widget.name,
                style: TextStyle(
                  decoration: widget.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: const Color.fromRGBO(122, 119, 119, 1),
                  decorationThickness: 2,
                  fontSize: 18,
                  color: widget.isDone
                      ? const Color.fromRGBO(122, 119, 119, 1)
                      : const Color.fromRGBO(245, 245, 245, 1),
                ),
              ),
            ],
          ),
          Text(
            widget.time,
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(122, 119, 119, 1),
            ),
          ),
        ],
      ),
    );
  }
}
