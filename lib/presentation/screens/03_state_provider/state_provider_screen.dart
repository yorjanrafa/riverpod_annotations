import 'package:a05_riverpod_annotations/config/helpers/random_generator.dart';
import 'package:a05_riverpod_annotations/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(darkModeProvider);
    final username = ref.watch(usernameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            icon: Icon(
                isDarkMode
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                size: 100),
            onPressed: () {
              ref.read(darkModeProvider.notifier).toggleDarkMode();
            },
          ),
          Text(username, style: const TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label: Text('$counter', style: const TextStyle(fontSize: 100)),
            onPressed: () {
              ref.read(counterProvider.notifier).increaseByOne();
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          ref
              .read(usernameProvider.notifier)
              .changeName(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}
