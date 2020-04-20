import 'package:flutter/material.dart';
import 'package:newsapp/ui/AboutDeveloper.dart';
import 'package:newsapp/ui/Everything.dart';
import 'package:newsapp/ui/HeadLines.dart';

import 'model/DrawerItem.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedDrawerIndex = 0;
  static final drawerItems = [
    new DrawerItem("Headlines", Icons.label_important),
    new DrawerItem("Politics", Icons.account_balance),
    new DrawerItem("Sports", Icons.directions_bike),
    new DrawerItem("Social", Icons.people),
    new DrawerItem("Science", Icons.wb_incandescent),
    new DrawerItem("Finance", Icons.attach_money),
    new DrawerItem("Technology", Icons.computer),
    new DrawerItem("About Developer", Icons.aspect_ratio)
  ];
  String appBarTitle = drawerItems[0].title;

  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HeadLines();
      case 1:
        return Everything(drawerItems[pos].title);
      case 2:
        return Everything(drawerItems[pos].title);
      case 3:
        return Everything(drawerItems[pos].title);
      case 4:
        return Everything(drawerItems[pos].title);
      case 5:
        return Everything(drawerItems[pos].title);
      case 6:
        return Everything(drawerItems[pos].title);
      case 7:
        return AboutDeveloper();
    }
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == selectedDrawerIndex,
        onTap: () => onSelectItem(i),
      ));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Viksah Parajuli"),
                accountEmail: Text("vparajuli819@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage("https://media-exp1.licdn.com/"
                      "dms/image/C5103AQHpTGlUbyGzMQ/profile-displayphoto-shrink_200_200/"
                      "0?e=1593043200&v=beta&t=skK2ABYx6mafAFVa44kJ5_CPTZiW3RVzzt3e9a_AKpQ"),
                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text("V"),
                  )
                ],
              ),
              Column(children: drawerOptions)
            ],
          ),
        ),
        body: getDrawerItemWidget(selectedDrawerIndex));
  }

  Future<void> onSelectItem(int index) async {
    setState(() {
      appBarTitle = drawerItems[index].title;
      selectedDrawerIndex = index;
    });

    Navigator.of(context).pop(); // close the drawer
  }
}
