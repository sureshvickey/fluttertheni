import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_theniguide/screens/tabs_screen.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_theniguide/widgets/Dialogs.dart';
class AnimatedFlutterLogo extends StatefulWidget {
  static const routeName = '/Splash-Screen';

  @override
  State<StatefulWidget> createState() => new _AnimatedFlutterLogoState();
}

class _AnimatedFlutterLogoState extends State<AnimatedFlutterLogo> {

  @override
  void initState() {
    isConnected().then((internet) {
      if (internet) {
        // set state while we fetch data from API
        setState(() {
          // calling API to show the data
          // you can also do it with any button click.
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => TabsScreen()));
        });
      } else {
        /*Display dialog with no internet connection message*/
        NointernetPop();
        //showLoadingDialog(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new  WillPopScope(
        onWillPop: exitpopup,
        child: new Scaffold(
        body: Center(
          child: Image.asset(
              'assets/images/new_splash_screen.png',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill
          ),
        ),
        ),
    );
  }
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<bool> NointernetPop() {
    return showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: new Text('No Internet'),
        content: new Text('Please Check Internet Connection'),
        actions: <Widget>[
          new FlatButton(
         //   onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
           onPressed: () {
             Navigator.of(context).pop(false);
             initState();
           },
            child: new Text('Retry'),
          ),
        ],
      ),
    ) ?? false;
  }

  Future<bool> exitpopup() {
    return showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: ()  {
              Navigator.of(context).pop(false);
              initState();
            },
            child: new Text('Retry'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }
// body: Image.asset('assets/images/new_splash_screen.jpg'), //   <-- image

  Future<void> showLoadingDialog(
      BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }

}

