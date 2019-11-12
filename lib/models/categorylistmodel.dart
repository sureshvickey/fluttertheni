import 'category.dart';

class categorylistmodel{
  List<category> catList;

  categorylistmodel({this.catList});

  categorylistmodel.fromJson(List<dynamic> parsedJson){
    catList=new List<category>();
    parsedJson.forEach((v){
      catList.add(category.fromJson(v));
    });
  }
}