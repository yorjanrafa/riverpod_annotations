import 'package:a05_riverpod_annotations/config/config.dart';
import 'package:a05_riverpod_annotations/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todos_provider.g.dart';

const uuid = Uuid();

enum TodosFilterType { all, completed, pending }

@Riverpod(keepAlive: true)
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  TodosFilterType build() => TodosFilterType.all;

  void changeCurrentFilter(TodosFilterType newFilter) {
    state = newFilter;
  }
}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() => [
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: DateTime.now()),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: DateTime.now()),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null),
        Todo(
            id: uuid.v4(),
            description: RandomGenerator.getRandomName(),
            completedAt: null),
      ];

  void createTodo(String description) {
    state = [
      ...state,
      Todo(id: uuid.v4(), description: description, completedAt: null),
    ];
    print(state);
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        todo = todo.copyWith(completedAt: todo.done ? null : DateTime.now());
      }
      return todo;
    }).toList();
  }
}

@riverpod
List<Todo> filteredTodos(Ref ref) {
  final currentFilter = ref.watch(todoCurrentFilterProvider);
  final todos = ref.watch(todosProvider);
  switch (currentFilter) {
    case TodosFilterType.all:
      return todos;
    case TodosFilterType.completed:
      return todos.where((todo) => todo.done).toList();
    case TodosFilterType.pending:
      return todos.where((todo) => !todo.done).toList();
  }
}
