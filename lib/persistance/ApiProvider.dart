import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/HeadlineResponse.dart';
import 'package:newsapp/utils/Secret.dart';

class ApiProvider {
  Client client = Client();
  Map<String, String> requestHeaders = {'Authorization': Secret.aPI};

  Future<HeadlineResponse> fetchTopHeadlines() async {
    final response = await client.get(
        Secret.baseUrl + "top-headlines?country=au", //&pageSize=${Secret.headlineCount}
        headers: requestHeaders);
    print(response.body.toString());

    if (response.statusCode == 200) {
      return HeadlineResponse.fromJson(json.decode(response.body));
    } else
      throw Exception(
          'Failed to load fetchTopHeadlines: ${response.statusCode}');
  }
}
