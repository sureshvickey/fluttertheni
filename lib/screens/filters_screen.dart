import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'package:flutter_theniguide/screens/tabs_screen.dart';
import 'package:url_launcher/url_launcher.dart';
class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop:  () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => TabsScreen())),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Contact Us'),
          ),
          drawer: MainDrawer(),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  buildSectionTitle(context,"Test2",Icons.add),
                  buildSectionTitleLauncher(context,"Test2",Icons.add,"https://play.google.com/store/apps/details?id=com.thenikaran.guide"),
                  buildSectionTitle(context,"Test2",Icons.add),
                  buildSectionTitleLauncher(context,"Test2",Icons.add,"https://play.google.com/store/apps/details?id=com.thenikaran.guide"),
                ],
              ),
            ),
          ),
        );
  }


  Widget buildSectionTitle(BuildContext context, String text,IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 150),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
          new Icon(icon),
            new Text(text),
          ]
      )
    );
  }

  Widget buildSectionTitleLauncher(BuildContext context, String text,IconData icon,String urlString) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 150),
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Icon(icon),
        new GestureDetector(
          onTap: () {
            launch(urlString);
          },
          child: new Text("my Title"),
        )
            ]
        )
    );
  }
}
