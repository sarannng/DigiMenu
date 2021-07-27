import 'package:Cafe_Manager/index/index.dart';
import 'package:flutter/material.dart';

import 'index-menu.dart';
 
class Orderplaced extends StatefulWidget {
  @override
  _OrderplacedState createState() => _OrderplacedState();
}

class _OrderplacedState extends State<Orderplaced> {
  Future<bool> _backbuttonpressed() {
    // return showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text('Thankyou For Ordering !!'),
    //     actions: <Widget>[
    //       // FlatButton(
    //       //   child: Text('No'),
    //       //   onPressed: () => Navigator.pop(context, false),
    //       // ),
    //       FlatButton(
    //           child: Text('Back to Shopping!!'),
    //           onPressed: () {
    //             Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (BuildContext context) => Index()));
    //           })
    //     ],
    //   ),
    // );
  
  print('sarang');
   Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => Indexnew()));
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/order.png'),
                Text(
                  'Your order is placed!!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text('Will be delivered shortly '),

                RaisedButton(
                  color: Colors.redAccent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent
                    ),
                    child: Text('Back to main Screen', style: TextStyle(color: Colors.white),),
                  ),

                  onPressed: (){
                   Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => Indexnew()));

                }),
              ],
            ),
          ),
        ),
        onWillPop: _backbuttonpressed);
  }
}
