import 'package:flutter/foundation.dart';
import './place.dart';
class category {
  String categoryId;
  String categoryName;
  String category_image;
  List<dynamic> placeData;

  category(String categoryId,String categoryName,String category_image,List<dynamic> placeData){
    this.categoryId=categoryId;
    this.categoryName=categoryName;
    this.category_image=category_image;
    this.placeData=placeData;
  }

  category.fromJson(Map  json):
        categoryId= json['categoryId'],
        categoryName= json['categoryName'],
        category_image= json['category_image'],
        placeData=json['place'];

  Map<String, dynamic> toJson() {
    //final Map<String, dynamic> data = new Map<String, dynamic>();
return{
  'categoryId':categoryId,
  'categoryName':categoryName,
  'category_image':category_image,
  'placeData':placeData
};
  }
}

