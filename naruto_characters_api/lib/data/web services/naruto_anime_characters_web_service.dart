import 'package:dio/dio.dart';
import '../../core/constants.dart';

class NarutoAnimeCharactersWebService {
  late Dio dio;
  NarutoAnimeCharactersWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllNarutoAnimeCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data['characters'].toString());
      return response.data['characters'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

}
