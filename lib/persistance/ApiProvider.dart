import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/NewsResponse.dart';
import 'package:newsapp/utils/Secret.dart';

class ApiProvider {
  Client client = Client();
  Map<String, String> requestHeaders = {'Authorization': Secret.aPI};



  Future<NewsResponse> fetchTopHeadlines() async {
    final response = await client.get(
        "${Secret.baseUrl}top-headlines?country=au",
        headers: requestHeaders);
    print(response.body.toString());

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else
      throw Exception(
          'Failed to load fetchTopHeadlines: ${response.statusCode}');
  }

  Future<NewsResponse> fetchSpecificNews(String key) async {
    final response = await client.get("${Secret.baseUrl}everything?q=$key",
        headers: requestHeaders);
    print(response.body.toString());

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else
      throw Exception(
          'Failed to load fetchTopHeadlines: ${response.statusCode}');
  }
}
