import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussneice%20logic/GOT%20Cubit/cubit/got_cubit.dart';
import '../../bussneice%20logic/cubit/naruto_anime_characters_cubit_cubit.dart';
import '../../core/helpers.dart';
import '../../data/models/got_quote.dart';
import '../../data/models/naruto_anime_character.dart';
import '../widgets/character_info_design.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<NarutoAnimeCharacter> allNarutoAnimeCharacters;
  late List<GOTquote> allRandomQuotes;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NarutoAnimeCharactersCubitCubit>(context)
        .getAllNarutoAnimeCharacters();
    BlocProvider.of<GotCubit>(context).randomQuotes();
  }

  Widget buildBlockWidgetForNaruto(BuildContext context) {
    return BlocBuilder<NarutoAnimeCharactersCubitCubit,
        NarutoAnimeCharactersCubitState>(
      builder: (context, state) {
        if (state is NarutoAnimeCharactersLoaded) {
          allNarutoAnimeCharacters = (state).allNarutoAnimeCharacters;
          return buildPageViewBuilder();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }
      },
    );
  }

  Widget buildPageViewBuilder() {
    return Container(
      height: 450,
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: allNarutoAnimeCharacters.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: CharacterInfoDesign(
            narutoAnimeCharacter: allNarutoAnimeCharacters[index + 1],
          ),
        ),
      ),
    );
  }

  Widget buildBlockWidgetforGOT(BuildContext context) {
    return BlocBuilder<GotCubit, GotState>(
      builder: (context, state) {
        if (state is GOTquoteLoaded) {
          allRandomQuotes = (state).randomQuotes;
          return buildPageViewBuilderForGOT();
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }
      },
    );
  }

  Widget buildPageViewBuilderForGOT() {
    return Container(
      height: 200,
      margin: const EdgeInsets.fromLTRB(20, 0, 25, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: allRandomQuotes.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('${allRandomQuotes.length}'),
                  Text(
                    '${allRandomQuotes[index].sentence}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  10.verTicalSpave,
                  Text('${allRandomQuotes[index].character!.name}'),
                  5.verTicalSpave,
                  Text('${allRandomQuotes[index].character!.slug}'),
                  5.verTicalSpave,
                  allRandomQuotes[index].character!.house!.name != null
                      ? Text('${allRandomQuotes[index].character!.house!.name}')
                      : const Text("Unknown"),
                  5.verTicalSpave,
                  allRandomQuotes[index].character!.house!.slug != null
                      ? Text('${allRandomQuotes[index].character!.house!.slug}')
                      : const Text("Unknown"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: buildBlockWidgetForNaruto(context),
            ),
            buildBlockWidgetforGOT(context),
          ],
        ),
      ),
    );
  }
}
