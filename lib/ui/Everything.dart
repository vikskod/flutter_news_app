import 'package:flutter/material.dart';
import 'package:newsapp/bloc/SpecificBloc.dart';
import 'package:newsapp/model/NewsResponse.dart';

String _key;

class Everything extends StatefulWidget {

  Everything(String key) {
    _key = key;
  }

  @override
  _EverythingState createState() => _EverythingState();
}

class _EverythingState extends State<Everything> {
  var newsWidgetList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    specificBloc.fetchSpecificNews(_key);
    return Container(
      child: Center(
        child: StreamBuilder(
          stream: specificBloc.specificNews,
          builder: (context, AsyncSnapshot<NewsResponse> snapshot) {
            if (snapshot.hasData) {
              return buildAllEverythingScreen(snapshot.data);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  SingleChildScrollView buildAllEverythingScreen(NewsResponse data) {
    print("========= SIZE For $_key ========${data.articles.length}");
    for (var i = 0; i < data.articles.length; i++) {
      var d = data.articles[i];
      newsWidgetList.add(Card(
        elevation: 2.0,
        child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage:
                  NetworkImage(d.urlToImage != null ? d.urlToImage : ""),
              backgroundColor: Colors.blue,
            ),
            title: Text(
              d.title,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            )),
      ));
    }

    return SingleChildScrollView(
      child: Column(
        children: newsWidgetList,
      ),
    );
  }
}
