import 'package:Cafe_Manager/admin/delivered.dart';
import 'package:Cafe_Manager/admin/dispatch.dart';
import 'package:Cafe_Manager/admin/neworder.dart';
import 'package:flutter/material.dart';
 

class Admin extends StatefulWidget {
  Admin({Key key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red[900],
                  Colors.red[800],
                  Colors.red[400],
                ],
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.new_releases),
                    Text('New order')
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.directions_bike),
                    Text('Dispatched')
                  ],
                ),
              ),
              Tab(
                child: Column(
                  children: <Widget>[Icon(Icons.done_all), Text('Delivered')],
                ),
              ),
            ],
          ),
          title: Text('Admin Digi menu App '),
        ),
        body: TabBarView(
          children: [
            Neworder(),
            Dispatch(),
            Delivered(),
          ],
        ),
      ),
    );
  }
}
