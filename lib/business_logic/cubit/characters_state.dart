part of 'characters_cubit.dart';

@immutable
abstract class CharactersStates {}

class CharactersInitial extends CharactersStates {}

class CharactersLoaded extends CharactersStates {
  final List<Character> characters ;
  CharactersLoaded(this.characters);
}

class QuotesLoaded extends CharactersStates {
  final List<Quote> quote ;
  QuotesLoaded(this.quote);
}
