import 'package:a05_riverpod_annotations/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouterScreen extends ConsumerWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider + Go Router'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          ref.read(appRouterProvider).pop();
        },
      ),
    );
  }
}
