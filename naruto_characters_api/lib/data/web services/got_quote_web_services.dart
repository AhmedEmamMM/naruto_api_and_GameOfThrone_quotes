import 'package:dio/dio.dart';

class GOTwebServices {
  late Dio dio;
  GOTwebServices() {
    // BaseOptions options = BaseOptions(
    //   baseUrl: 'https://api.gameofthronesquotes.xyz/v1/',
    //   receiveDataWhenStatusError: true,
    //   connectTimeout: const Duration(seconds: 30),
    //   receiveTimeout: const Duration(seconds: 30),
    // );
    // Dio(options);
    dio = createAndSetupDio();
  }

  Future<List<dynamic>> getRandomQuotes() async {
    try {
      Response response = await dio.get('random/100');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.baseUrl = 'https://api.gameofthronesquotes.xyz/v1/'
    ..options.connectTimeout = const Duration(seconds: 30)
    ..options.receiveDataWhenStatusError = true
    ..options.receiveTimeout = const Duration(seconds: 30);

  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: false,
    requestBody: true,
    responseHeader: false,
    responseBody: true,
    error: true,
  ));

  return dio;
}
