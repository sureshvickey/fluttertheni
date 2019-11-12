import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_theniguide/models/place.dart';
import 'package:flutter_theniguide/widgets/place_item.dart';

class CatDetail extends StatelessWidget {
  static const routeName = '/category-detail';
  List placeData;
  String title;
  var places = new List<place>();

  CatDetail({@required this.placeData,@required this.title});


  @override
  Widget build(BuildContext context) {
    final CatDetail args = ModalRoute.of(context).settings.arguments;
    placeData =args.placeData;
    places =  placeData.map((model) => place.fromJson(model)).toList();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
        body: new GridView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: placeData == null ? 0 : placeData.length,
          itemBuilder: (BuildContext context,int index){
            return PlaceItem(
              id: places[index].id,
              title: places[index].title,
              imageUrl: places[index].image,
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
    );
  }
}