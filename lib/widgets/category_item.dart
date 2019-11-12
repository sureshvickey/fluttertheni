import 'package:flutter/material.dart';
import 'package:flutter_theniguide/models/place.dart';
import 'package:flutter_theniguide/screens/category_detail.dart';

class CatItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final List<dynamic> placeData;


  CatItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  @required this.placeData
  });


  void selectItem(BuildContext context) {
    Navigator.of(context).pushNamed(
      CatDetail.routeName,
      arguments: CatDetail(placeData: placeData,title: title,),
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
                    fit: BoxFit.fill,
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