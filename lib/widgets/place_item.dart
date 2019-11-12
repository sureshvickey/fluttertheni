import 'package:flutter/material.dart';
import 'package:flutter_theniguide/screens/place_detail.dart';

class PlaceItem extends StatelessWidget {

   String id;
   String title;
   String imageUrl;
   String facility;
   String address;
   String phoneno;
   String website;
   String desc;
   String lat;
   String lon;

  PlaceItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.facility,
    @required this.address,
    @required this.phoneno,
    @required this.website,
    @required this.desc,
    @required this.lat,
    @required this.lon
  });


  void selectItem(BuildContext context) {
    Navigator.of(context).pushNamed(
      placeDetail.routeName,
      arguments: placeDetail(id: id,title: title,imageUrl: imageUrl,
      facility: facility,address: address,phoneno: phoneno,website: website,desc: desc,lat: lat,lon: lon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItem(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 115,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    width: 200,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}