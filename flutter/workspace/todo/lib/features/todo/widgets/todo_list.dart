import 'package:flutter/material.dart';
import 'package:todo/core/models/todo.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: TodoItem(todo: todos[index]),
        );
      },
    );
  }
}
