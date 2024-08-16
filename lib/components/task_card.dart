import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String name;
  final String time;
  final bool isDone;
  final void Function(bool?) onChanged;
  final void Function() onDelete;

  const TaskCard({
    super.key,
    required this.name,
    required this.time,
    required this.isDone,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  checkColor: const Color.fromRGBO(122, 119, 119, 1),
                  activeColor: const Color.fromRGBO(21, 21, 21, 1),
                  value: isDone,
                  onChanged: onChanged,
                ),
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
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(122, 119, 119, 1),
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[400],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
