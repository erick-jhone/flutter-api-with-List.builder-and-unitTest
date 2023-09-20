import 'package:flutter/material.dart';
import 'package:projeto_listview_builder/models/todo_model.dart';
import 'package:projeto_listview_builder/repositories/todo_repository.dart';

class HomeController {
  List<ToDoModel> toDos = [];
  late ToDoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);
 

  HomeController(ToDoRepository repository) {
    _repository = repository ?? ToDoRepository();
  }

  Future start() async {
    state.value = HomeState.loading;
    try {
    // Simula um atraso de 2 segundos antes de buscar os dados
    await Future.delayed(Duration(seconds: 2));

    toDos = await _repository.fetchToDos();

    state.value = HomeState.sucess;
  } catch (e) {
    state.value = HomeState.error;
  }
  }
}

enum HomeState { start, loading, sucess, error }
