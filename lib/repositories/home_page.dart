import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_listview_builder/controllers/home_controller.dart';
import 'package:projeto_listview_builder/repositories/todo_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(ToDoRepository());

  _sucess() {
    return ListView.builder(
        itemCount: controller.toDos.length,
        itemBuilder: (context, index) {
          var todo = controller.toDos[index];
          return ListTile(
            title: Text('Item ${todo.title}'),
          );
        });
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  _error() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            controller.start();
          },
          child: Text('Testar novamente')),
    );
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.error:
        return _error();
      case HomeState.loading:
        return _loading();
      case HomeState.sucess:
        return _sucess();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Lista'),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.state,
        builder: (context, state, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
