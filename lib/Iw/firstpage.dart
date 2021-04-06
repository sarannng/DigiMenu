import 'package:Cafe_Manager/Iw/adminpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cargaragemain extends StatefulWidget {
  Cargaragemain({Key key}) : super(key: key);

  @override
  _CargaragemainState createState() => _CargaragemainState();
}

class _CargaragemainState extends State<Cargaragemain> {
  @override
  Widget build(BuildContext context) {
    TextEditingController vehical_type = new TextEditingController();
    TextEditingController vehical_num = new TextEditingController();
    TextEditingController vehical_driver_name = new TextEditingController();
    TextEditingController lon = new TextEditingController();
    TextEditingController lat = new TextEditingController();

    senddata() {
      FirebaseFirestore.instance.collection('garage').doc().set({
        'vehical_type': vehical_type.text,
        'vehical_num': vehical_num.text,
        'vehical_driver_name': vehical_driver_name.text,
        'lon': double.parse(lon.text),
        'lat': double.parse(lat.text),
      });
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Our garage app'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Admin()));
              })
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Fill the garage details below.')],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Vehical Type'),
                controller: vehical_type,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Vehical number'),
                controller: vehical_num,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Driver name'),
                controller: vehical_driver_name,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Longitude'),
                controller: lon,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Latutude'),
                controller: lat,
              ),
            ),
            RaisedButton(
                child: Text(
                  'Send Data',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blueGrey,
                onPressed: () {
                  print('tapped');
                  senddata();
                }),
            SizedBox(
              height: 30,
            ),
            Text('Powered by'),
            Image.network(
                'https://iwtechnocrats.com/assets/images/resources/logo-light.png')
          ],
        ),
      ),
    );
  }
}
