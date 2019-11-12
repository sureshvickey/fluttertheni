import 'package:flutter/material.dart';

class placeDetail extends StatelessWidget{
  static const routeName = '/place-detail';
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

  placeDetail({
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


  @override
  Widget build(BuildContext context) {
    final placeDetail args = ModalRoute.of(context).settings.arguments;
    id=args.id;title=args.title;address=args.address;website=args.website;phoneno=args.phoneno;
    if(website==null||website.isEmpty){
      website="updatesoon";
    }
    if(phoneno==null||phoneno.isEmpty){
      phoneno="+91-#########";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                args.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            buildSectionTitle(context, 'Informaion'),
            buildContainer(
                ListViewBuilder(context,address,Icons.place),100
            ),
            buildContainer(
              ListViewBuilder(context,website,Icons.web),70
            ),
            buildContainer(
              ListViewBuilder(context,phoneno,Icons.phone),70
            ),
            buildSectionTitle(context, 'Description'),
          ],
        ),
      ),
    );
  }


  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child,double size) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      height: size,
      width: 500,
      child: child,
    );
  }

  Widget ListViewBuilder(BuildContext ctx,String text,IconData icon){
    return  ListView.builder(
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(icon),
            ),
            title: Text(
              text,
            ),
          ),
          Divider()
        ],
      ),
      itemCount: 1,
    );
  }
}
