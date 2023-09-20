//@dart=2.12
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:projeto_listview_builder/models/todo_model.dart';

class ToDoRepository {
  late Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  ToDoRepository([Dio? client]) {
    dio = client ?? Dio();
  }

  Future<List<ToDoModel>> fetchToDos() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((json) => ToDoModel.fromJson(json)).toList();
  }
}
