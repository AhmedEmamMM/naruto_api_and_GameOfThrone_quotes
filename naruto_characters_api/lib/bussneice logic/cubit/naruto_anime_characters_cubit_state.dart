part of 'naruto_anime_characters_cubit_cubit.dart';

@immutable
sealed class NarutoAnimeCharactersCubitState {}

final class NarutoAnimeCharactersCubitInitial
    extends NarutoAnimeCharactersCubitState {}

class NarutoAnimeCharactersLoaded extends NarutoAnimeCharactersCubitState {
  final List<NarutoAnimeCharacter> allNarutoAnimeCharacters;

  NarutoAnimeCharactersLoaded(this.allNarutoAnimeCharacters);
}
