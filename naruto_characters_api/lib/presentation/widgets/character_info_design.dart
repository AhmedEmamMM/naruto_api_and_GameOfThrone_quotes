import 'package:flutter/material.dart';
import '../../data/models/naruto_anime_character.dart';

class CharacterInfoDesign extends StatelessWidget {
  final NarutoAnimeCharacter narutoAnimeCharacter;
  const CharacterInfoDesign({super.key, required this.narutoAnimeCharacter});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(narutoAnimeCharacter.images![0]) ,
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(),
          const Spacer(),
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
            child: Text(
              narutoAnimeCharacter.name!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
