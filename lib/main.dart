import 'package:flutter/material.dart';
import 'package:flutter_theniguide/screens/tabs_screen.dart';
import 'package:flutter_theniguide/screens/categories_screen.dart';
import 'package:flutter_theniguide/screens/place_detail.dart';
import 'package:flutter_theniguide/screens/category_detail.dart';
import 'package:flutter_theniguide/screens/splashscreen.dart';
import 'package:flutter_theniguide/screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.green,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: AnimatedFlutterLogo(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => AnimatedFlutterLogo(),
        placeDetail.routeName:(context) => placeDetail(),
        CatDetail.routeName:(context) => CatDetail(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => TabsScreen(),);
      },
    );
  }
}
