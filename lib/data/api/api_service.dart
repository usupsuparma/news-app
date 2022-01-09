import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/models/article.dart';

class ApiService {
  final String _baseUrl = 'https://newsapi.org/v2/';
  final String _apiKey = 'a5c69aac86514d5b83bde9de044ec818';
  final String _category = 'business';
  final String _country = 'id';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(_baseUrl +
        "top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));

    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
