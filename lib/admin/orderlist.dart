import 'package:Cafe_Manager/admin/orderaddress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 
class Orderlist extends StatefulWidget {
  final String totala;
  final String uid;
  Orderlist({Key key, this.totala, this.uid, }) : super(key: key);

  @override
  _OrderlistState createState() => _OrderlistState();
}

class _OrderlistState extends State<Orderlist> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
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

          Expanded(
                flex: 10,
                //yaha se hatana chalu kia
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('/user/${widget.uid}/buffer_cart')
                      .snapshots(),
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
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.2,
                                                color: Colors.black38)),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Container(
                                                    child: Image.network(
                                                      value['image'],
                                                      height: 100,
                                                      width: 100,
                                                    ),
                                                  ),
                                                  // Container(
                                                  //   //  padding: EdgeInsets.all(4),
                                                  //   child:
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        value['item'],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        height: 12,
                                                      ),
                                                      Text(
                                                        'Rs.' +
                                                            value['price']
                                                                .toString() +
                                                            '/-',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .redAccent,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                      Row(
                                                        children: <Widget>[
                                                          //quantity measurerer start
                                                          // Container(
                                                          //   decoration:
                                                          //       BoxDecoration(),
                                                          //   child: IconButton(
                                                          //     icon: Icon(
                                                          //       Icons.add,
                                                          //       size: 15,
                                                          //     ),
                                                          //     onPressed: () {
                                                          //       // setState(() {
                                                          //       //   flexContainer1[index].text=  4.toString();
                                                          //       // });
                                                          //       // incrementC1Flex(
                                                          //       //     index);
                                                          //       // print(value
                                                          //       //     .data
                                                          //       //     .values);
                                                          //     },
                                                          //   ),
                                                          // ),
                                                          // Container(
                                                          //   width: 20,
                                                          //   child: TextField(
                                                          //     // controller:
                                                          //     //     flexContainer1[
                                                          //     //         index],
                                                          //     maxLength: 1,
                                                          //     textAlign:
                                                          //         TextAlign
                                                          //             .center,
                                                          //     readOnly: true,
                                                          //   ),
                                                          // ),
                                                          // Container(
                                                          //   child: IconButton(
                                                          //     icon: Icon(
                                                          //         Icons
                                                          //             .minimize,
                                                          //         size: 15),
                                                          //     onPressed: () {
                                                          //       // decrementC1Flex(
                                                          //       //     index);
                                                          //     },
                                                          //   ),
                                                          // ),

                                                          // quantity measurerer ends

                                                          Text(
                                                              'Quantity:  ${value['user_quant']}'),

                                                          //  Text(value['item']),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  // ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text('Amount'),
                                                      Text(
                                                        (int.parse(value[
                                                                    'price']) *
                                                                int.parse(value[
                                                                    'user_quant']))
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )

                                                      // Container(
                                                      //   height: 30.0,
                                                      //   decoration: BoxDecoration(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10),
                                                      //       color: Color
                                                      //           .fromRGBO(
                                                      //               255,
                                                      //               140,
                                                      //               64,
                                                      //               1),
                                                      //       boxShadow: [
                                                      //         BoxShadow(
                                                      //           color: Colors
                                                      //                   .grey[
                                                      //               500],
                                                      //           offset:
                                                      //               Offset(
                                                      //                   0.0,
                                                      //                   1.5),
                                                      //           blurRadius:
                                                      //               1.5,
                                                      //         ),
                                                      //       ]),
                                                      //   child: Container(
                                                      //     decoration:
                                                      //         BoxDecoration(
                                                      //       color: Colors
                                                      //           .transparent,
                                                      //     ),
                                                      //     padding:
                                                      //         EdgeInsets.all(
                                                      //             8),
                                                      //     child: InkWell(
                                                      //         // onTap: () {
                                                      //         //   print(
                                                      //         //       'bn tap');
                                                      //         //   print(value
                                                      //         //       .documentID);
                                                      //         //   // print(flexContainer1[
                                                      //         //   //         index]
                                                      //         //   //     .text);
                                                      //         //   Navigator.push(
                                                      //         //       context,
                                                      //         //       MaterialPageRoute(
                                                      //         //           builder: (BuildContext context) => Buypage(
                                                      //         //               docid: value.documentID,
                                                      //         //               quantitem: (flexContainer1[index].text))));
                                                      //         // },
                                                      //         child: Center(
                                                      //           child: Text(
                                                      //             'Buy now',
                                                      //             style: TextStyle(
                                                      //                 color: Colors
                                                      //                     .white,
                                                      //                 fontWeight:
                                                      //                     FontWeight.bold),
                                                      //           ),
                                                      //         )),
                                                      //   ),
                                                      // ),
                                                      // SizedBox(
                                                      //   height: 8,
                                                      // ),
                                                      // Container(
                                                      //   padding:
                                                      //       EdgeInsets.all(8),
                                                      //   height: 30.0,
                                                      //   decoration: BoxDecoration(
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   10),
                                                      //       color: Color
                                                      //           .fromRGBO(
                                                      //               222,
                                                      //               199,
                                                      //               53,
                                                      //               1),
                                                      //       boxShadow: [
                                                      //         BoxShadow(
                                                      //           color: Colors
                                                      //                   .grey[
                                                      //               500],
                                                      //           offset:
                                                      //               Offset(
                                                      //                   0.0,
                                                      //                   1.5),
                                                      //           blurRadius:
                                                      //               1.5,
                                                      //         ),
                                                      //       ]),
                                                      //   child: Material(
                                                      //     color: Colors
                                                      //         .transparent,
                                                      //     child: InkWell(
                                                      //         // onTap: onPressed,
                                                      //         child: Center(
                                                      //       child: Text(
                                                      //           'Add to cart',
                                                      //           style: TextStyle(
                                                      //               color: Colors
                                                      //                   .white,
                                                      //               fontWeight:
                                                      //                   FontWeight
                                                      //                       .bold)),
                                                      //     )),
                                                      //   ),
                                                      // ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )));
                              })
                              .values
                              .toList(),

                          //   }
                        );
                    }
                  },
                )),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Grand Total:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      Text(
                        ' ${widget.totala}/-',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                        height: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(61, 212, 71, 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500],
                                offset: Offset(0.0, 1.5),
                                blurRadius: 1.5,
                              ),
                            ]),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () {
                               // Navigator.pop(context); 

                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Orderaddress(uid: '${widget.uid}')));
                              },
                              child: Center(
                                child: Text('Delivery Details',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              )),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

}