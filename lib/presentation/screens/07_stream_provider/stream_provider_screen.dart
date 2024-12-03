import 'package:a05_riverpod_annotations/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const StreamView(),
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final usersInchatAsync = ref.watch(usersInChatProvider);
    if (usersInchatAsync.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (usersInchatAsync.hasError) {
      return Center(
        child: Text('{$usersInchatAsync.error}'),
      );
    }

    final users = usersInchatAsync.value!;
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        return ListTile(
          title: Text('${user}'),
        );
      },
    );
  }
}
