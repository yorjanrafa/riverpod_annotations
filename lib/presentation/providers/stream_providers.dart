import 'package:a05_riverpod_annotations/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stream_providers.g.dart';

@Riverpod(keepAlive: true)
Stream<List<String>> usersInChat(Ref ref) async* {
  final names = <String>[];
/*   yield names;
 */
  await for (final name in RandomGenerator.randomNameStream()) {
    names.add(name);
    yield names;
  }
}
