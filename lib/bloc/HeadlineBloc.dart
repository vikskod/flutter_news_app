import 'package:newsapp/model/NewsResponse.dart';
import 'package:newsapp/persistance/Repository.dart';
import 'package:rxdart/rxdart.dart';

/*
The class responsible for displaying the Headline to the user should have its
own BLoC class that holds the business logic.
 */

class HeadlineBloc {
  Repository _repository = Repository();

  final _headlineFetcher = PublishSubject<NewsResponse>();

  Stream<NewsResponse> get headline => _headlineFetcher.stream;

  fetchHeadline() async {
    NewsResponse headlineResponse = await _repository.fetchHeadline();
    _headlineFetcher.sink.add(headlineResponse);
  }

  dispose() {
    _headlineFetcher.close();
  }
}

final headlineBloc = HeadlineBloc();