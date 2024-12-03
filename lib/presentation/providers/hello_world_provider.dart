import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'hello_world_provider.g.dart'; // Asegúrate de que este nombre sea correcto

@riverpod
String helloWorld(Ref ref) {
  return 'hello world';
}
