import 'package:a05_riverpod_annotations/config/config.dart';
import 'package:a05_riverpod_annotations/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider + Providers'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref
              .read(todosProvider.notifier)
              .createTodo(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}

class _TodoView extends ConsumerWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context, ref) {
    final currentFilter = ref.watch(todoCurrentFilterProvider);
    // final todos = ref.watch(todosProvider);
    final todos = ref.watch(filteredTodosProvider);
    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: const [
            ButtonSegment(value: TodosFilterType.all, icon: Text('Todos')),
            ButtonSegment(
                value: TodosFilterType.completed, icon: Text('Invitados')),
            ButtonSegment(
                value: TodosFilterType.pending, icon: Text('No invitados')),
          ],
          selected: <TodosFilterType>{currentFilter},
          onSelectionChanged: (value) {
            ref
                .read(todoCurrentFilterProvider.notifier)
                .changeCurrentFilter(value.first);
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return SwitchListTile(
                  title: Text(todo.description),
                  value: todo.done,
                  onChanged: (value) {
                    ref.read(todosProvider.notifier).toggleTodo(todo.id);
                  });
            },
          ),
        )
      ],
    );
  }
}
