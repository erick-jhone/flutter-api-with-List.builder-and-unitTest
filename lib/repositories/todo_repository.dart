import 'package:dio/dio.dart';
import 'package:projeto_listview_builder/models/todo_model.dart';

class ToDoRepository {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<ToDoModel>> fetchToDos() async {
    final response = await dio.get(url);
    final list = response.data as List;
    List<ToDoModel> todos = [];
    for (var json in list) {
      final todo = ToDoModel.fromJson(json);
      todos.add(todo);
    }
    return todos;
  }
}
