import 'dart:convert';
import 'package:flutter_theniguide/models/BeerListModel.dart';
// get reponse from API
import 'package:http/http.dart' as http;
// to check internet connection
import 'package:connectivity/connectivity.dart';
import 'package:flutter_theniguide/models/categorylistmodel.dart';
import 'package:flutter_theniguide/models/placelistmodel.dart';

// API url
String url = "https://api.punkapi.com/v2/beers";
String catUrl="http://www.thenikaran.co.in/app_dashboard/JSON/placenew.php";
String placeurl="http://www.thenikaran.co.in/app_dashboard/JSON/allplaces.php";
// Here we are using http package to fetch data from API
// We defined retrun type BeerListModel
Future<BeerListModel> getBeerListData() async {
  final response = await http.get(url,);
  //json.decode used to decode response.body(string to map)
  return BeerListModel.fromJson(json.decode(response.body));
}

Future<categorylistmodel> getcategorylist() async {
  final response = await http.get(catUrl,);
  //json.decode used to decode response.body(string to map)
  return categorylistmodel.fromJson(json.decode(response.body));
}

Future<placelistmodel> getPlaceList() async {
  final response = await http.get(placeurl,);
  //json.decode used to decode response.body(string to map)
  var convertdatatojson = json.decode(response.body);
  List data=convertdatatojson['place'];
  return placelistmodel.fromJson(data);
}