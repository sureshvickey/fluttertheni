import 'package:flutter/foundation.dart';

class place {
   String id;
   String title;
   String placeId;
   String address;
   String phone;
   String website;
   String catId;
   String facility;
   String image;
   String description;
   String image1;
   String image2;
   String image3;
   String image4;
   String image5;
   String latitude;
   String longitude;
   String date;

  place(String id,String title,String placeId,String address,String phone,String website,String catId,
  String facility,String image,String description,String image1,String image2,String image3,String image4,
      String image5,String latitude,String longitude,String date) {
    this.id; this.title; this.placeId; this.address; this.phone;
    this.website; this.catId; this.facility; this.image; this.description; this.image1;
    this.image2; this.image3; this.image4; this.image5; this.latitude; this.longitude; this.date;}

  place.fromJson(Map json):
      id=json['id'],
      title=json['title'],
        placeId=json['placeId'],
        address=json['address'],
        phone=json['phone'],
        website=json['website'],
        catId=json['catId'],
        facility=json['facility'],
        image=json['image'],
        description=json['description'],
        image1=json['image1'],
        image2=json['image2'],
        image3=json['image3'],
        image4=json['image4'],
        image5=json['image5'],
        latitude=json['latitude'],
        longitude=json['longitude'],
        date=json['date'];

   Map<String, dynamic> toJson() {
return{
  'id':id,
'title': title,
'placeId': placeId,
'address': address,
 'phone':phone,
 'website':website,
 'catId':catId,
 'facility': facility,
 'image': image,
'description': description,
'image1': image1,
 'image2': image2,
'image3': image3,
'image4': image4,
'image5': image5,
'latitude': latitude,
'longitude': longitude,
'date': date
};
  }


}