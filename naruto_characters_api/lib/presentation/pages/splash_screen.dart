import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussneice%20logic/GOT%20Cubit/cubit/got_cubit.dart';
import '../../bussneice%20logic/cubit/naruto_anime_characters_cubit_cubit.dart';
import '../../data/repository/got_repo.dart';
import '../../data/repository/naruto_anime_characters_reposetory.dart';
import '../../data/web%20services/got_quote_web_services.dart';
import '../../data/web%20services/naruto_anime_characters_web_service.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late NarutoAnimeCharactersRepository narutoAnimeCharactersRepository;
  late NarutoAnimeCharactersCubitCubit narutoAnimeCharactersCubitCubit;
  late GOTrepo goTrepo;
  late GotCubit gotCubit;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      narutoAnimeCharactersRepository =
          NarutoAnimeCharactersRepository(NarutoAnimeCharactersWebService());
      narutoAnimeCharactersCubitCubit =
          NarutoAnimeCharactersCubitCubit(narutoAnimeCharactersRepository);
      goTrepo = GOTrepo(GOTwebServices());
      gotCubit = GotCubit(goTrepo);

      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => narutoAnimeCharactersCubitCubit),
                    BlocProvider(create: (context) => gotCubit),
                  ],
                  child: const HomePage(),
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          child: Image.asset(
            "assets/images/810Xo+d8xlL._AC_UF1000,1000_QL80_DpWeblab_.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
