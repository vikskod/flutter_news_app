import 'package:flutter/material.dart';
import 'package:getflutter/components/carousel/gf_carousel.dart';
import 'package:newsapp/bloc/HeadlineBloc.dart';
import 'package:newsapp/model/HeadlineResponse.dart';

class HeadLines extends StatefulWidget {
  @override
  _HeadLinesState createState() => _HeadLinesState();
}

class _HeadLinesState extends State<HeadLines> {
  var topHeadlineList = <Widget>[];
  var otherHeadlineList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    headlineBloc.fetchHeadline();
    return Container(
      child: Center(
        child: StreamBuilder(
          stream: headlineBloc.headline,
          builder: (context, AsyncSnapshot<HeadlineResponse> snapshot) {
            if (snapshot.hasData) {
              return buildAllHeadlineScreen(snapshot.data);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  SingleChildScrollView buildAllHeadlineScreen(HeadlineResponse data) {
    print("========= SIZE ========${data.articles.length}");
    for (var i = 0; i < data.articles.length; i++) {
      var d = data.articles[i];
      if (i <= 5) {
        // Showing top headline list till list position 5
        topHeadlineList.add(Container(
          margin: EdgeInsets.all(8.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(d.urlToImage != null ? d.urlToImage : "",
                      fit: BoxFit.cover, height: 1000.0, width: 1000.0),
                  Container(
                      decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0)
                      ],
                    ),
                  )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        d.title,
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
      }
      if (i > 5) {
        // Showing other headline list after list position 5
        otherHeadlineList.add(Card(
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
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          GFCarousel(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            pauseAutoPlayOnTouch: Duration(milliseconds: 2500),
            items: topHeadlineList,
          ),
          Column(
            children: otherHeadlineList,
          )
        ],
      ),
    );
  }

  Future refreshHeadline() async {
    setState(() {});
  }
}
