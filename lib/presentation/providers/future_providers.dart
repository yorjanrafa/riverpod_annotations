import 'package:a05_riverpod_annotations/config/helpers/pokemon_information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
Future<String> pokemonName(Ref ref) async {
  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  ref.onDispose(() {
    print('Se esta eliminando este provider');
  });
  return pokemonName;
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() => 1;

  void nextPokemon() {
    state++;
  }

  void previousPokemon() {
    if (state > 1) {
      state--;
    }
  }
}

@Riverpod(keepAlive: true)
Future<String> pokemon(Ref ref, int pokemonId) async {
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
}
