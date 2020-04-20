import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              elevation: 2.0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      // Getting my image from Linkedin
                      backgroundImage: NetworkImage(
                          "https://media-exp1.licdn.com/"
                              "dms/image/C5103AQHpTGlUbyGzMQ/profile-displayphoto-shrink_200_200/"
                              "0?e=1593043200&v=beta&t=skK2ABYx6mafAFVa44kJ5_CPTZiW3RVzzt3e9a_AKpQ"),
                      radius: 60.0,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Vikash Parajuli",
                      style: TextStyle(fontSize: 24.0),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      "Mobile App Developer",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Hello I'm Vikash Parajuli currently i'm learning Flutter to get extensive knowledge about mobile application development",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: "NotoSans",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                "Social Links",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(FontAwesomeIcons.linkedin),
                      onPressed: () {
                        launchURL(
                            "https://www.linkedin.com/in/vikashparajuli/");
                      },
                      color: Colors.blue,
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.stackOverflow),
                      onPressed: () {
                        launchURL(
                            "https://stackoverflow.com/users/2630728/vikash-parajuli");
                      },
                      color: Colors.orange,
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.twitter),
                      onPressed: () {
                        launchURL("https://twitter.com/ParajuliVikash");
                      },
                      color: Colors.lightBlue,
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.facebook),
                      onPressed: () {
                        launchURL("https://www.facebook.com/vikspjl");
                      },
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(
                "Skills",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Card(
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      "https://fenzodigital.com/wp-content/uploads/2018/08/Mobile-App.png"),
                ),
                title: Text("Mobile Development"),
                subtitle: Text("Android, iOS, Flutter"),
              ),
            ),
            Card(
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      "https://s3.amazonaws.com/media.skillcrush.com/skillcrush/wp-content/uploads/2018/11/Blog_design_dev.jpg.webp"),
                ),
                title: Text("Web Development"),
                subtitle: Text("HTML, CSS, Javascript"),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ),
    );
  }

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
