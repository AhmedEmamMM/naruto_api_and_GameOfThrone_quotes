import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/naruto_anime_character.dart';
import '../../data/repository/naruto_anime_characters_reposetory.dart';

part 'naruto_anime_characters_cubit_state.dart';

class NarutoAnimeCharactersCubitCubit
    extends Cubit<NarutoAnimeCharactersCubitState> {
  final NarutoAnimeCharactersRepository narutoAnimeCharactersRepository;
  List<NarutoAnimeCharacter> narutoAnimeCharacters = [];
  NarutoAnimeCharactersCubitCubit(this.narutoAnimeCharactersRepository)
      : super(NarutoAnimeCharactersCubitInitial());

  List<NarutoAnimeCharacter> getAllNarutoAnimeCharacters() {
    narutoAnimeCharactersRepository
        .getAllNarutoAnimeCharacters()
        .then((allNarutoAnimeCharacters) {
      emit(NarutoAnimeCharactersLoaded(allNarutoAnimeCharacters));
      narutoAnimeCharacters = allNarutoAnimeCharacters;
    });
    return narutoAnimeCharacters;
  }
}
