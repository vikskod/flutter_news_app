import 'package:newsapp/model/NewsResponse.dart';
import 'package:newsapp/persistance/Repository.dart';
import 'package:rxdart/rxdart.dart';

class SpecificBloc {
  Repository _repository = Repository();

  final specificNewsFetcher = PublishSubject<NewsResponse>();

  Stream<NewsResponse> get specificNews => specificNewsFetcher.stream;

  fetchSpecificNews(String key) async {
    NewsResponse newsResponse = await _repository.fetchSpecificNews(key);
    specificNewsFetcher.sink.add(newsResponse);
  }
}

final specificBloc = SpecificBloc();
