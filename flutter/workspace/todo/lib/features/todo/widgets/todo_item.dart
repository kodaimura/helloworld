import 'package:flutter/material.dart';
import 'package:todo/core/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          todo.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: todo.completed ? Colors.grey[600] : Colors.black87,
            decoration: todo.completed ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Icon(
          todo.completed ? Icons.check_box : Icons.check_box_outline_blank,
          color: todo.completed ? Colors.teal : Colors.grey,
        ),
        onTap: () {
          // Todo の完了/未完了を切り替える処理
        },
      ),
    );
  }
}
