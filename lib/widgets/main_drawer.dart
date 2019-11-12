import 'package:flutter/material.dart';
import 'package:flutter_theniguide/screens/tabs_screen.dart';
import 'package:flutter_theniguide/screens/allplaces2_screen.dart';
import 'package:flutter_theniguide/screens/filters_screen.dart';
import 'package:launch_review/launch_review.dart';
//import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Theni Guide',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Home', Icons.home, () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => TabsScreen()));
          }),
          buildListTile('Contact Us', Icons.phone, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          buildListTile('Rate Us', Icons.rate_review, () {
            //LaunchReview.launch(androidAppId: com.thenikaran.guide);
           // launch('https://play.google.com/store/apps/details?id=com.thenikaran.guide');

          }),
          buildListTile('More Apps', Icons.add_circle_outline, () {
           // launch("https://play.google.com/store/apps/developer?id=vignesh+s");
          }),
        ],
      ),
    );
  }
}
