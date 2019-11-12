import './place.dart';

class placelistmodel{
  List<place> placeList;

  placelistmodel({this.placeList});

  placelistmodel.fromJson(List<dynamic> parsedJson){
    placeList=new List<place>();
    parsedJson.forEach((v){
      placeList.add(place.fromJson(v));
    });
  }
}

