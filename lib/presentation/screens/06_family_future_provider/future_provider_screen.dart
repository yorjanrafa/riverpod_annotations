import 'package:a05_riverpod_annotations/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;
  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon id $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (data) => Text(data),
          error: (error, StackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () {
              if (pokemonId <= 1) return;
              pokemonId--;
              setState(() {});
              // ref.invalidate(pokemonNameProvider);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'btn-2',
            child: const Icon(Icons.add),
            onPressed: () {
              pokemonId++;
              setState(() {});
              // ref.invalidate(pokemonNameProvider);
            },
          ),
        ],
      ),
    );
  }
}
