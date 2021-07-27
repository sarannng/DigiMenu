import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Orderaddress extends StatefulWidget {
  final String uid;
  Orderaddress({Key key,  this.uid}) : super(key: key);

  @override
  _OrderaddressState createState() => _OrderaddressState();
}

class _OrderaddressState extends State<Orderaddress> {
  final namec = TextEditingController();
  final addressc = TextEditingController();
  final phonec = TextEditingController();
  String name;
  String address;
  String phone;
  getdeliverydetails() {
    var data = Firestore.instance.collection('user').document('${widget.uid}').get();
    data.then((onValue) {
      setState(() {
        namec.text = onValue.data()['cname'];
        addressc.text = onValue.data()['caddress'];
        phonec.text = onValue.data()['cphone'];
      });
    });
  }

  @override
  void initState() {
    getdeliverydetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // child: Expanded(

        appBar: AppBar(
          title: Text('Delivery Details'),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   'Kindly enter correct details',
              //   style: TextStyle(
              //       color: Colors.black87,
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold),
              // ),
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
                    child: TextField( readOnly: true,
                      controller: namec,
                      decoration: InputDecoration(
                        hintText: 'Customer Name',
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
                    child: TextField( readOnly: true,
                      maxLines: 5,
                      controller: addressc,
                      decoration: InputDecoration(
                        hintText: 'Customer Address',
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
                      readOnly: true,
                      controller: phonec,
                      decoration: InputDecoration(
                        hintText: 'Customer Contact',
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
                    Navigator.pop(context);
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
                        "Back",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        //),
        );
  }
}
