import 'package:appbloc/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
      connectTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future <List <dynamic>> getAllCharacters() async {
   try{
     Response response = await dio.get('characters');
     print('Characters Data : ' + response.data.toString());
     return response.data;
   }catch(error){
     print('Characters Data Error : ' + error.toString());
     return [];
   }
  }

  Future <List <dynamic>> getCharacterQuotes(String charName) async {
    try{
      Response response = await dio.get('quote' , queryParameters: {'author' : charName});
      print('Quote Data : ' + response.data.toString());
      return response.data;
    }catch(error){
      print('Quote Data Error : ' + error.toString());
      return [];
    }
  }
}