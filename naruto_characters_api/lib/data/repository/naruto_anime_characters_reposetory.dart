// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:naruto_characters_api/data/models/naruto_anime_character.dart';
import 'package:naruto_characters_api/data/web%20services/naruto_anime_characters_web_service.dart';

class NarutoAnimeCharactersRepository {
  NarutoAnimeCharactersWebService narutoAnimeCharactersWebService;
  NarutoAnimeCharactersRepository(this.narutoAnimeCharactersWebService);

  Future<List<NarutoAnimeCharacter>> getAllNarutoAnimeCharacters() async {
    final narutoAnimeCharacters =
        await narutoAnimeCharactersWebService.getAllNarutoAnimeCharacters();
    return narutoAnimeCharacters
        .map((character) => NarutoAnimeCharacter.fromJson(character))
        .toList();
  }
}
