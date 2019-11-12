import 'package:flutter/material.dart';
import './allplaces_screen.dart';
import './allplaces2_screen.dart';
import './categories_screen.dart';
import 'package:flutter_theniguide/widgets/main_drawer.dart';
import './MyHomePage.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  @override
  Widget build(BuildContext context) {
    return  new WillPopScope(
        onWillPop: _onWillPop,
        child: DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Theni Guide'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.place,
                ),
                text: 'All Places',
              ),
            ],
          ),
        ),drawer: Drawer(child: MainDrawer(),),
        body: TabBarView(
          children: <Widget>[
            CategoriesScreen(),
            AllPlaces2(),
          ],
        ),
      ),
        )
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }
  }
