import 'package:flutter/material.dart';
import 'package:todo/core/models/todo.dart';
import 'package:todo/features/todo/widgets/todo_list.dart';
import 'package:todo/features/todo/todo_service.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late Future<List<Todo>> _todos;

  @override
  void initState() {
    super.initState();
    _todos = TodoService().fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: FutureBuilder<List<Todo>>(
        future: _todos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No todos available.'));
          } else {
            return TodoList(todos: snapshot.data!);
          }
        },
      ),
    );
  }
}
