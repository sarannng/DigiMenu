import 'package:Cafe_Manager/Menu/orderplaced.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
 
class Cdetails extends StatefulWidget {
  final String itemid;
  final String quantity;
  final int total;
  final String uid;
  const Cdetails({
    Key key,
    this.itemid,
    this.quantity,
    this.total,
    this.uid,
  }) : super(key: key);
  @override
  _CdetailsState createState() => _CdetailsState();
}

class _CdetailsState extends State<Cdetails> {
  final name = TextEditingController();
  final address = TextEditingController();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Customer Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              //  borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(224, 21, 18, 1),
                Color.fromRGBO(217, 40, 37, 1),
              ])),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Kindly enter correct details',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(225, 97, 27, 0.3),
                        offset: Offset(10, 10),
                        blurRadius: 5)
                  ],
                ),
                child: Container(
                  //padding: EdgeInsets.only(left: 12),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color.fromRGBO(255, 199, 115, 0.2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(225, 97, 27, 0.3),
                        offset: Offset(10, 10),
                        blurRadius: 5)
                  ],
                ),
                child: Container(
                  //padding: EdgeInsets.only(left: 12),
                  child: TextField(
                    maxLines: 5,
                    controller: address,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color.fromRGBO(255, 199, 115, 0.2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(225, 97, 27, 0.3),
                        offset: Offset(10, 10),
                        blurRadius: 5)
                  ],
                ),
                child: Container(
                  //padding: EdgeInsets.only(left: 12),
                  child: TextField(
                    controller: phone,
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color.fromRGBO(255, 199, 115, 0.2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  var now = new DateTime.now();
                  var formatter = new DateFormat('dd-MM-yyyy');
                  String formattedTime = DateFormat('kk:mm:a').format(now);
                  String formattedDate = formatter.format(now);
                  print(formattedTime);
                  print(formattedDate);

                  Firestore.instance
                      .collection('user')
                      .document('${widget.uid}')
                      .setData({
                    'cname': '${name.text}',
                    'caddress': '${address.text}',
                    'cphone': '${phone.text}',
                    'cid': '${widget.uid}',
                    'total': '${widget.total}',
                    'ordertime': '$formattedTime',
                    'orderdate': '$formattedDate',
                  });

                  Firestore.instance
                      .collection('order')
                      .document('${widget.uid}')
                      .setData({
                    'cname': '${name.text}',
                    'caddress': '${address.text}',
                    'cphone': '${phone.text}',
                    'cid': '${widget.uid}',
                    'ordertime': '$formattedTime',
                    'orderdate': '$formattedDate',
                    'total': '${widget.total}',
                  });

                  var dd = Firestore.instance
                      .collection('user')
                      .document('${widget.uid}')
                      .collection('current_order')
                      .document('${widget.uid}')
                      .collection('cart')
                      .snapshots();
                  dd.listen((onval) {
                    for (int i = 0; i < onval.documents.length; i++) {
                      var id = onval.documents[i].documentID;

                      var temp = Firestore.instance
                          .collection('user')
                          .document('${widget.uid}')
                          .collection('current_order')
                          .document('${widget.uid}')
                          .collection('cart')
                          .document(id)
                          .snapshots();
                      temp.listen((event) {
                        var image = event.data()['image'];
                        var item = event.data()['item'];
                        var price = event.data()['price'];
                        var user_quant = event.data()['user_quant'];

                        Firestore.instance
                            .collection('user')
                            .document('${widget.uid}')
                            .collection('buffer_cart')
                            .document(id)
                            .setData({
                          'image': image,
                          'item': item,
                          'price': price,
                          'user_quant': user_quant,
                        });

                        Firestore.instance
                            .collection('user')
                            .document('${widget.uid}')
                            .collection('current_order')
                            .document('${widget.uid}')
                            .collection('cart')
                            .document(id)
                            .delete();
                      });
                    }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Orderplaced()));
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.redAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Place Order",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Image.asset(
              'assets/fruit.png',
              height: MediaQuery.of(context).size.height / 3,
            )
          ],
        ),
      ),
    );
  }
}
