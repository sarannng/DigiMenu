 

import 'package:Cafe_Manager/admin/orderlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
 
class Neworder extends StatefulWidget {
  Neworder({Key key}) : super(key: key);

  @override
  _NeworderState createState() => _NeworderState();
}

setdataindespatch(String uid) async {
  var data = Firestore.instance.collection('order').document(uid).get();
  data.then((onValue) {
    var add = onValue.data()['caddress'];
    var id = uid;
    var name = onValue.data()['cname'];
    var phone = onValue.data()['cphone'];
    // var ordertime =   onValue.data['ordertime'];
    // var orderdate =   onValue.data['orderdate'];
    var total = onValue.data()['total'];
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String ordertime = DateFormat('kk:mm:a').format(now);
    String orderdate = formatter.format(now);
    print(ordertime);
    print(orderdate);
    print(id);
    Firestore.instance.collection('dispatch').document(uid).setData({
      'caddress': add,
      'cname': name,
      'cid': id,
      'cphone': phone,
      'ordertime': ordertime,
      'orderdate': orderdate,
      'total': total,
    });
    Firestore.instance.collection('order').document(uid).delete();
  });
}

class _NeworderState extends State<Neworder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 3,
            //yaha se hatana chalu kia
            child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('/order').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Image.asset(
                            'assets/owl.png',
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.height / 3,
                          )
                        ],
                      ),
                    );
                  default:
                    return new ListView(
                      //   itemBuilder: (context,index){
                      // flexContainer1.add(new TextEditingController());

                      //Your code here
                      children: snapshot.data.documents
                          .asMap()
                          .map((index, value) {
                            // flexContainer1
                            //     .add(new TextEditingController());

                            return MapEntry(
                                index,
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red[100],
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(184, 178, 178, 1)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      onTap: () {
                                       var data= Firestore.instance.collection('order').document('${value.documentID}').get();
                                        
                                          data.then((onval){
                                           var uid=  onval.data()['cid'];

                                           Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    Orderlist(
                                                        totala:
                                                            value['total'], uid: uid)));
                                          });
                                        
                                        
                                      },
                                      onLongPress: () async {
                                        print('lolskdf');

                                         var data= Firestore.instance.collection('order').document('${value.documentID}').get();
                                        
                                          data.then((onval){
                                           var uid=  onval.data()['cid'];

                                            setdataindespatch(uid);
                                          });
                                        

                                        //deletefromorder();
                                      },
                                      title: Text(
                                        value['cname'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                      subtitle: Text(value['caddress']),
                                      isThreeLine: true,
                                      trailing: Text(
                                        value['total'] + '/-',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      leading: Text(
                                        value['orderdate'] +
                                            '\n ' +
                                            value['ordertime'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black38,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ));
                          })
                          .values
                          .toList(),

                      //   }
                    );
                }
              },
            )),
      ],
    );
  }
}
