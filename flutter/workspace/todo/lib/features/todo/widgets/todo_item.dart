import 'package:flutter/material.dart';
import 'package:todo/core/models/todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  TodoItem({required this.todo});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
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
          widget.todo.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: widget.todo.completed ? Colors.grey[600] : Colors.black87,
            decoration: widget.todo.completed ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Icon(
          widget.todo.completed ? Icons.check_box : Icons.check_box_outline_blank,
          color: widget.todo.completed ? Colors.teal : Colors.grey,
        ),
        onTap: () {
          setState(() {
            widget.todo.completed = !widget.todo.completed;
          });
        },
      ),
    );
  }
}
