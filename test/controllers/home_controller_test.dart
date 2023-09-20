import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_listview_builder/controllers/home_controller.dart';
import 'package:projeto_listview_builder/models/todo_model.dart';
import 'package:projeto_listview_builder/repositories/todo_repository.dart';

class ToDoRepositoryMock extends Mock implements ToDoRepository {}

main() {
  final repository = ToDoRepositoryMock();

  final controller = HomeController(repository);
  when(() => repository.fetchToDos()).thenThrow(Exception());

  test('deve mudar o estado para erro se a requisição falhar', () async {
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.error);
  });
}
