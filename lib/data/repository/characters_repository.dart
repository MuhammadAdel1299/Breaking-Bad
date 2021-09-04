import 'package:appbloc/data/model/characters.dart';
import 'package:appbloc/data/model/quote.dart';
import 'package:appbloc/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices ;

  CharactersRepository(this.charactersWebServices);

  Future <List <Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }

  Future <List <Quote>> getCharacterQuotes(String charName) async {
    final quotes = await charactersWebServices.getCharacterQuotes(charName);
    return quotes.map((charQuote) => Quote.fromJson(charQuote)).toList();
  }
}