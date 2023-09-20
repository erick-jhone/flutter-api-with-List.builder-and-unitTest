import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_listview_builder/repositories/todo_repository.dart';

main() {
  final respository = ToDoRepository();

  test('Deve trazer lista', () async {
    final list = await respository.fetchToDos();
    print(list[4].title);
    expect(list[4].title,
        'laboriosam mollitia et enim quasi adipisci quia provident illum');
  });
}
