import 'package:a05_riverpod_annotations/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonName = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonName.when(
          data: (data) => Text(data),
          loading: () => const CircularProgressIndicator(),
          error: (error, StackTrace) => Text('$error'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              // ref.invalidate(pokemonNameProvider);
              ref.read(pokemonIdProvider.notifier).nextPokemon();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'btn-2',
            child: const Icon(Icons.minimize_outlined),
            onPressed: () {
              // ref.invalidate(pokemonNameProvider);
              ref.read(pokemonIdProvider.notifier).previousPokemon();
            },
          ),
        ],
      ),
    );
  }
}
