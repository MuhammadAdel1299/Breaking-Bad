import 'package:appbloc/data/model/characters.dart';
import 'package:appbloc/data/model/quote.dart';
import 'package:appbloc/data/repository/characters_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersStates> {

  final CharactersRepository charactersRepository;

  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getALlCharacters (){
    charactersRepository.getAllCharacters().then((character) {
      emit(CharactersLoaded(character));
      this.characters = character;
    });
    return characters;
  }

  void getQuotes (String charName){
    charactersRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }

}
