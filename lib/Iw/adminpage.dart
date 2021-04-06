 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class Admin extends StatefulWidget {
  Admin({Key key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  void openmap(String docid) async {

      print(docid);

  var cor=  FirebaseFirestore.instance.collection('garage').doc(docid).get();
    double lat; double lon;

  cor.then((value) async {
   double lona= await value.data()['lon'];
   double lata= await value.data()['lat'];
final availableMaps = await MapLauncher.installedMaps;
print(availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

await availableMaps.first.showMarker(
  coords: Coords(lona, lata),
  title: await value.data()['vehical_driver_name']
);
    setState(() {
      lon=  lona;
      lat=   lata;
    });
  
  });




  // final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
  // if (await canLaunch(url)) {
  //   await launch(url);
  // } else {
  //   throw 'Could not launch $url';
  // }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      appBar: AppBar(
        title: Text('Garage Data'),
      ),

       body: Container(
         child: Column(
           children: [





             Expanded(child: 
            StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('garage').snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) return new Text('Loading...');
    return new ListView(
      children: snapshot.data.docs.map((DocumentSnapshot document) {
        return new ListTile(
          title: new Text(document['vehical_driver_name'], style: TextStyle(color: Colors.redAccent),),
          subtitle: new Text(document['vehical_num'] ,style: TextStyle(color: Colors.black38),),
          leading: new Text(document['vehical_type'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          trailing: IconButton(icon: Icon(Icons.location_on), onPressed: (){ 
            
            openmap( document.id );
          }),
        );
      }).toList(),
    );
            
             }))
            ],
         ),
       ),
    );
  }
}