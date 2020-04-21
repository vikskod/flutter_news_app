import 'package:flutter/material.dart';
import 'package:newsapp/model/NewsResponse.dart';

class NewsDetail extends StatelessWidget {
  final Articles articles;

  NewsDetail(this.articles);

  @override
  Widget build(BuildContext context) {
    final topContentText = Container(
      alignment: Alignment.bottomCenter,
      child: Text(
        articles.title != null ? articles.title : "",
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.white, fontSize: 25.0),
      ),
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: NetworkImage(
                    articles.urlToImage != null ? articles.urlToImage : ""),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.1),
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.5)
            ],
          )),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      articles.content != null ? articles.content : "",
      textAlign: TextAlign.justify,
      style: TextStyle(fontSize: 18.0),
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
