import 'package:newsapp/model/NewsResponse.dart';
import 'package:newsapp/persistance/ApiProvider.dart';

/*
This Repository class mediates between the domain and the data mapping layers,
acting like an in-memory domain object collection.
*/
class Repository {
  ApiProvider provider = ApiProvider();

  Future<NewsResponse> fetchHeadline() => provider.fetchTopHeadlines();

  Future<NewsResponse> fetchSpecificNews(key) =>
      provider.fetchSpecificNews(key);
}
