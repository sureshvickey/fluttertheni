import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_theniguide/models/place.dart';
import 'package:flutter_theniguide/widgets/place_item.dart';
import 'package:flutter_theniguide/widgets/Dialogs.dart';
class AllPlaces extends StatefulWidget {
  @override
  Homepageplces createState() => new Homepageplces();
}

class Homepageplces extends State<AllPlaces> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final String url="http://thenikaran.co.in/app_dashboard/JSON/allplaces.php";
  List data;
  var places = new List<place>();
  bool _dataloaded = false;
  @override
  void initState(){
    super.initState();
    this.getJsondata();
  }

  Future<String> getJsondata() async{

    var response = await http.get(
        Uri.encodeFull(url),
        headers: {
          "Accept":"application/json"
        }
    );

    print(response.body);

    setState(() {
      var convertdatatojson = json.decode(response.body);
      data=convertdatatojson['place'];
      //Iterable data = json.decode(response.body);
      places = data.map((model) => place.fromJson(model)).toList();

    });
//    Dialogs.showLoadingDialog(context, _keyLoader);
//    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
            child: new GridView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context,int index){
            return PlaceItem(
              id: places[index].id,
              title: places[index].title,
              imageUrl: places[index].image,
              facility: places[index].facility,
              address: places[index].address,
              phoneno: places[index].phone,
              website: places[index].website,
              desc: places[index].description,
              lat: places[index].latitude,
              lon: places[index].longitude,
            );
          },
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
        )
        )  );
  }
}

Widget loadingView() => Center(
  child: CircularProgressIndicator(
    backgroundColor: Colors.red,
  ),
);

