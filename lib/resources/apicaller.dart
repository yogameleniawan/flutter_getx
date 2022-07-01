import 'package:get/get.dart';

class ApiCaller extends GetConnect {
  final url = 'https://api.kanye.rest';
  Future<String> fetchData() async {
    final response = await httpClient.get(url);
    return response.body['quote'] as String;
  }
}
