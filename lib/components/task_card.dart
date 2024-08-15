import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String name;
  final String time;
  final bool isDone;
  final void Function(bool?) onChanged;

  const TaskCard({
    super.key,
    required this.name,
    required this.time,
    required this.isDone,
    required this.onChanged,
  });

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
                value: isDone,
                onChanged: onChanged,
              ),
              Text(
                name,
                style: TextStyle(
                  decoration:
                      isDone ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: const Color.fromRGBO(122, 119, 119, 1),
                  decorationThickness: 2,
                  fontSize: 18,
                  color: isDone
                      ? const Color.fromRGBO(122, 119, 119, 1)
                      : const Color.fromRGBO(245, 245, 245, 1),
                ),
              ),
            ],
          ),
          Text(
            time,
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
