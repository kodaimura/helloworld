import 'package:todo/core/models/todo.dart';
import 'package:todo/core/services/api_service.dart';

class TodoService {
  final ApiService apiService = ApiService(baseUrl: 'https://jsonplaceholder.typicode.com');

  Future<List<Todo>> fetchTodos() async {
    final data = await apiService.fetchTodos();
    return data.map((json) => Todo.fromJson(json)).toList();
  }
}
