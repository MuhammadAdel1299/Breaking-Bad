import 'package:appbloc/business_logic/cubit/characters_cubit.dart';
import 'package:appbloc/data/model/characters.dart';
import 'package:appbloc/data/web_services/characters_web_services.dart';
import 'package:appbloc/presentation/screens/character_details_screen.dart';
import 'package:appbloc/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';
import 'data/repository/characters_repository.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharactersCubit(charactersRepository),
            child: CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CharactersCubit(charactersRepository),
            child: CharactersDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
