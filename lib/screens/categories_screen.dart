import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_theniguide/models/category.dart';
import 'package:flutter_theniguide/widgets/category_item.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_theniguide/network/EndPoints.dart';
import 'package:flutter_theniguide/models/categorylistmodel.dart';
//void main() => runApp(new MaterialApp(
//  home:new CategoriesScreen(),
//));


class CategoriesScreen extends StatefulWidget {
  @override
  Homepage createState() => new Homepage();
}

class Homepage extends State<CategoriesScreen> {
 // final String url="http://thenikaran.co.in/app_dashboard/JSON/placenew.php";
 // List data;
  List placedata;
 // var categories = new List<category>();
Future<categorylistmodel> categories;
  @override
  void initState(){
    isConnected().then((internet) {
      if (internet) {
        // set state while we fetch data from API
        setState(() {
          // calling API to show the data
          // you can also do it with any button click.
          categories = getcategorylist();
        });
      } else {
        /*Display dialog with no internet connection message*/
      }
    });
    super.initState();
   // this.getJsondata();
  }

//  Future<String> getJsondata() async{
//    var response = await http.get(
//        Uri.encodeFull(url),
//        headers: {
//          "Accept":"application/json"
//        }
//    );
//
//    print(response.body);
//
//    setState(() {
//      var convertdatatojson = json.decode(response.body);
//      data = convertdatatojson;
//      //Iterable data = json.decode(response.body);
//      categories = data.map((model) => category.fromJson(model)).toList();
////     placedata=convertdatatojson['place'];
//
//    });
//  //  print(placedata.toString());
//    return "success";
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<categorylistmodel>(
            future: categories,
            builder: (context, snapshot) {
              // to show progress loading view add switch statment to handle connnection states.
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  {
                    // here we are showing loading view in waiting state.
                    return loadingView();
                  }
                case ConnectionState.active:
                  {
                    break;
                  }
                case ConnectionState.done:
                  {
                    // in done state we will handle the snapshot data.
                    // if snapshot has data show list else set you message.
                    if (snapshot.hasData) {
                      // hasdata same as data!=null
                      if (snapshot.data.catList != null) {
                        if (snapshot.data.catList.length > 0) {
                          // here inflate data list
                          return new GridView.builder(
        padding: const EdgeInsets.all(5),
          itemCount:  snapshot.data.catList == null ? 0 :  snapshot.data.catList.length,
        itemBuilder: (BuildContext context,int index){
          return CatItem(
            id:  snapshot.data.catList[index].categoryId,
            title: snapshot.data.catList[index].categoryName,
            imageUrl: snapshot.data.catList[index].category_image,
            placeData: snapshot.data.catList[index].placeData,
          );
        },
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 3 / 2,
    crossAxisSpacing: 5,
    mainAxisSpacing: 5,
    ),
    );

//                            ListView.builder(
//                              itemCount: snapshot.data.catList.length,
//                              itemBuilder: (context, index) {
//                                return generateColum(
//                                    snapshot.data.catList[index]);
//                              });
                        } else {
                          // display message for empty data message.
                          return noDataView("No data found");
                        }
                      } else {
                        // display error message if your list or data is null.
                        return noDataView("No data found");
                      }
                    } else if (snapshot.hasError) {
                      // display your message if snapshot has error.
                      return noDataView("Something went wrong");
                    } else {
                      return noDataView("Something went wrong");
                    }
                    break;
                  }
                case ConnectionState.none:
                  {
                    return noDataView("Please Check Internet Connection");
                    break;
                  }
              }
            }),
      )
//      body: new GridView.builder(
//        padding: const EdgeInsets.all(5),
//          itemCount: data == null ? 0 : data.length,
//        itemBuilder: (BuildContext context,int index){
//          return CatItem(
//            id: categories[index].categoryId,
//            title: categories[index].categoryName,
//            imageUrl: categories[index].category_image,
//            placeData: categories[index].placeData,
//          );
//        },
//    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//    maxCrossAxisExtent: 200,
//    childAspectRatio: 3 / 2,
//    crossAxisSpacing: 5,
//    mainAxisSpacing: 5,
//    ),
//    )
    );
  }
}

//new ListView.builder(
//        itemCount: data == null ? 0 : data.length,
//        itemBuilder: (BuildContext context,int index){
//          return PlaceItem(
//            id: places[index].id,
//            title: places[index].title,
//            imageUrl: places[index].image,
//          );
//        },
//      ),

Widget generateColum(category item) => Card(
  child: ListTile(
    leading: Image.network(item.category_image),
    title: Text(
      item.categoryName,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
    subtitle:
    Text(item.categoryId, style: TextStyle(fontWeight: FontWeight.w600)),
  ),
);


Widget loadingView() => Center(
  child: CircularProgressIndicator(
    backgroundColor: Colors.red,
  ),
);

// View to empty data message
Widget noDataView(String msg) => Center(
  child: Text(
    msg,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
  ),
);



Future<bool> isConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}