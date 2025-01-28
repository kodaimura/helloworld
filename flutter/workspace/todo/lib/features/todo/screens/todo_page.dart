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
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder<List<Todo>>(
          future: _todos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No todos available.', style: TextStyle(fontSize: 18, color: Colors.grey)));
            } else {
              return TodoList(todos: snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
