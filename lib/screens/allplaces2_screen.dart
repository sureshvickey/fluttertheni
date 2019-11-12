import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_theniguide/models/place.dart';
import 'package:flutter_theniguide/widgets/place_item.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_theniguide/network/EndPoints.dart';
import 'package:flutter_theniguide/models/placelistmodel.dart';
//void main() => runApp(new MaterialApp(
//  home:new CategoriesScreen(),
//));


class AllPlaces2 extends StatefulWidget {
  static const routeName = '/all-places';
  @override
  Homepage createState() => new Homepage();
}

class Homepage extends State<AllPlaces2> {
  // final String url="http://thenikaran.co.in/app_dashboard/JSON/placenew.php";
  // List data;
  List placeitem;
  // var categories = new List<category>();
  Future<placelistmodel> categories;
  var places = new List<place>();
  @override
  void initState(){
    isConnected().then((internet) {
      if (internet) {
        // set state while we fetch data from API
        setState(() {
          // calling API to show the data
          // you can also do it with any button click.
          categories = getPlaceList();
        });
      } else {
        /*Display dialog with no internet connection message*/
      }
    });
    super.initState();
    // this.getJsondata();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<placelistmodel>(
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
                        if (snapshot.data.placeList != null) {
                          if (snapshot.data.placeList.length > 0) {
//                            placeitem= snapshot.data.placeList[0].placeData;
//                            places =  placeData.map((model) => place.fromJson(model)).toList();
                            // here inflate data list
                            return new GridView.builder(
                              padding: const EdgeInsets.all(5),
                              itemCount:  snapshot.data.placeList == null ? 0 :  snapshot.data.placeList.length,
                              itemBuilder: (BuildContext context,int index){
                                return PlaceItem(
                                  id:  snapshot.data.placeList[index].id,
                                  title: snapshot.data.placeList[index].title,
                                  imageUrl: snapshot.data.placeList[index].image,
                                  facility: snapshot.data.placeList[index].facility,
                                  address: snapshot.data.placeList[index].address,
                                  desc: snapshot.data.placeList[index].description,
                                  lat: snapshot.data.placeList[index].latitude,
                                  lon: snapshot.data.placeList[index].longitude,
                                  phoneno: snapshot.data.placeList[index].phone,
                                  website: snapshot.data.placeList[index].website,
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
                        //return noDataView('${snapshot.error}');
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
    );
  }
}

Widget generateColum(place item) => Card(
  child: ListTile(
    leading: Image.network(item.image),
    title: Text(
      item.title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
    subtitle:
    Text(item.id, style: TextStyle(fontWeight: FontWeight.w600)),
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