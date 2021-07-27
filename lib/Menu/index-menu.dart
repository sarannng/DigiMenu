
import 'package:Cafe_Manager/Menu/buypage.dart';
import 'package:Cafe_Manager/Menu/cart.dart';
import 'package:Cafe_Manager/admin/admin.dart';
import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Indexnew extends StatefulWidget {
  final String uid;
  final String qr;
  Indexnew({
    Key key,
    this.uid, this.qr,
  }) : super(key: key);

  @override
  _IndexnewState createState() => _IndexnewState();
}

class _IndexnewState extends State<Indexnew> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<TextEditingController> flexContainer1 = new List();
String cafename;
  int flexc1 = 0;
  int flexc2;
  int cartcount;

  String uid;

  getid() {
    var id = Firestore.instance.collection('user').document().documentID;
    Firestore.instance.collection('user').document(id).setData({});
    print(id);

    setState(() {
      uid = id;
    });
  }

  Color c1,c2,c3,c4,c5,c6= Colors.white;
  Color  t1,t2,t3,t4,t5,t6=Colors.black;
  String query;
  @override
  void initState() {
      print('=========================================================');
     String test='/root/1/${widget.qr}/';
     print(test);
        var tem= FirebaseFirestore.instance.collection('/root/1/menu').doc('${widget.qr}').snapshots();
  tem.listen((event) { 
    
    
    setState(() {
    cafename=event.data()['cafeName'];});

    print(cafename);
  }); 
      super.initState();
      
    getcartlistcount();
    contcolor(1);
  }

  clear(){
    setState(() {
       c1=c2=c3=c4=c5=c6= Colors.white;
     t1=t2=t3=t4=t5=t6=Colors.black;
    });
  }

  contcolor(index){
    switch (index) {
      case 1:
      clear();
        setState(() {
          c1=Colors.black54;
          t1=Colors.white;
          query='/root/1/menu/${widget.qr}/daily_ration';
          print("This is fuckin query" + query);
        });
        print(query);

         
        break;


        case 2:
        clear();
        setState(() {
          c2=Colors.black54;
          t2=Colors.white;
                   query='/root/1/menu/${widget.qr}/items';

        });

        print(query);

        break;


        
        case 3:
        clear();
        setState(() {
          c3=Colors.black54;
          t3=Colors.white;
          query='/godam/qdFnuRUilYbD4FphRVsI/sanitizers';
        });

        print(query);

        break;
      default:
    }

  }

  getcartlistcount() {
    var num = Firestore.instance
        .collection('user')
        .document('${widget.uid}')
        .collection('current_order')
        .document('${widget.uid}')
        .collection('cart')
        .snapshots();
    num.listen((onData) {
      var temo = onData.documents.length;
      setState(() {
        cartcount = temo;
      });
    });
  }

  listtype(pointer) {
    switch (pointer) {
      case 1:
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final flexContainer1 = TextEditingController();

    final flexContainer2 = TextEditingController();

    incrementC1Flex(index) {
      setState(() {
        print(index);
        print(flexContainer1[index].text);
        flexc1 = flexc1 + 1;
        var c1a = flexc1;
        print(c1a);
        flexContainer1[index].text = c1a.toString();
      });
    }

    decrementC1Flex(index) {
      setState(() {
        flexc1 = flexc1 - 1;
        print(flexc1);
        if (flexc1 < 1) {
          setState(() {
            flexc1 = 1;
          });
        } else {
          var c1b = flexc1;
          flexContainer1[index].text = c1b.toString();
        }
      });
    }

    showsnack(BuildContext context) {
      print('asdfasdsf');
      final snackBar = SnackBar(
          content: Text('Added to cart'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ));

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    showsnack1(BuildContext context) {
      print('asdfasdsf');
      final snackBar = SnackBar(
          content: Text('Please add quantity first'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ));

      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('$cafename'),
              // IconButton(
              //   icon: Icon(Icons.shopping_cart),
              //   onPressed: () {
              //    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Cart()));
              //   },
              // ),

              Badge(
                badgeColor: Colors.white,
                position: BadgePosition.topEnd(end: -5   ),
                badgeContent: Text(
                  cartcount.toString(),
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Cart(uid: widget.uid)));
                  },
                ),
              ),

              IconButton(
                icon: Icon(Icons.lightbulb_outline),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Admin()));
                },
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.lightBlue, Colors.indigo]),
            ),

             
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(203, 214, 207, 1),
                          ),
                          height: 39,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.search,
                                color: Color.fromRGBO(112, 105, 105, 1),
                              ),
                              Text(
                                'Search',
                                style: TextStyle(
                                    color: Color.fromRGBO(112, 105, 105, 1)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(onTap: () {
                                        contcolor(1);
                                      },
                                      
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        child: Container(
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: c1,
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    184, 178, 178, 1)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Daily Ration',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, color: t1 ),
                                            ),
                                          ),
                                        ),
                                      ),)
                                      ),
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(onTap: () {
                                        contcolor(2);
                                      },
                                      
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        child: Container(
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: c2,
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    184, 178, 178, 1)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Vegetable',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, color: t2),
                                            ),
                                          ),
                                        ),
                                      ),)
                                      ),
                                Expanded(
                                      flex: 1,
                                      child: InkWell(onTap: () {
                                        contcolor(3);
                                      },
                                      
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        child: Container(
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: c3,
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    184, 178, 178, 1)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Hygine ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,color: t3),
                                            ),
                                          ),
                                        ),
                                      ),)
                                      ),
                                  ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                Expanded(
                                      flex: 1,
                                      child: InkWell(onTap: () {
                                        
                                      },
                                      
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        child: Container(
                                          height: 36,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    184, 178, 178, 1)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Snacks ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),)
                                      ),
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(onTap: () {
                                        
                                      },
                                      
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        child: Container(
                                          height: 36,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    184, 178, 178, 1)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Chocolates ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),)
                                      ),
                               Expanded(
                                      flex: 1,
                                      child: InkWell(onTap: () {
                                        
                                      },
                                      
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        child: Container(
                                          height: 36,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    184, 178, 178, 1)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'More ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),)
                                      ),
                                   ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                  )),

              Expanded(
                  flex: 3,
                  //yaha se hatana chalu kia
                  child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance
                        .collection(query)
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
                                  height:
                                      MediaQuery.of(context).size.height / 3,
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
                                  flexContainer1
                                      .add(new TextEditingController());

                                  return MapEntry(
                                      index,
                                      Container(  margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [Colors.lightBlue, Colors.indigo]),
                        ),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 0.4, color: Colors.black38)),

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
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18),
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: IconButton(
                                                                icon: Icon(
                                                                  Icons.add,
                                                                  size: 15,
                                                                ),
                                                                onPressed: () {
                                                                  // setState(() {
                                                                  //   flexContainer1[index].text=  4.toString();
                                                                  // });
                                                                  incrementC1Flex(
                                                                      index);
                                                                  // print(value
                                                                  //     .data
                                                                  //     .values);
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 20,
                                                              child: TextField(
                                                                controller:
                                                                    flexContainer1[
                                                                        index],
                                                                maxLength: 1,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                readOnly: true,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: IconButton(
                                                                icon: Icon(
                                                                    Icons
                                                                        .minimize,
                                                                    size: 15),
                                                                onPressed: () {
                                                                  decrementC1Flex(
                                                                      index);
                                                                },
                                                              ),
                                                            ),
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
                                                        Container(
                                                          height: 30.0,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      140,
                                                                      64,
                                                                      1),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                          .grey[
                                                                      500],
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          1.5),
                                                                  blurRadius:
                                                                      1.5,
                                                                ),
                                                              ]),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8),
                                                            child: InkWell(
                                                                onTap: () {
                                                                  print(
                                                                      'bn tap');
                                                                  print(value
                                                                      .documentID);
                                                                  print(flexContainer1[
                                                                          index]
                                                                      .text);
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (BuildContext context) => Buypage(
                                                                              docid: value.documentID,
                                                                              quantitem: (flexContainer1[index].text))));
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                    'Buy now',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                )),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          height: 30.0,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: Color
                                                                  .fromRGBO(
                                                                      222,
                                                                      199,
                                                                      53,
                                                                      1),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                          .grey[
                                                                      500],
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          1.5),
                                                                  blurRadius:
                                                                      1.5,
                                                                ),
                                                              ]),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: InkWell(
                                                                onTap: () {
                                                                  print(
                                                                      'object');

                                                                  if (flexContainer1[
                                                                              index]
                                                                          .text !=
                                                                      '') {
                                                                    Firestore
                                                                        .instance
                                                                        .collection(
                                                                            'user')
                                                                        .document(
                                                                            '${widget.uid}')
                                                                        .collection(
                                                                            'current_order')
                                                                        .document(
                                                                            '${widget.uid}')
                                                                        .collection(
                                                                            'cart')
                                                                        .document()
                                                                        .setData({
                                                                      'image':
                                                                          '${value['image']}',
                                                                      'price':
                                                                          '${value['price']}',
                                                                      'user_quant':
                                                                          '${flexContainer1[index].text}',
                                                                      'item':
                                                                          '${value['item']}'
                                                                    });
                                                                    showsnack(
                                                                        context);
                                                                    // Navigator.push(
                                                                    //     context,
                                                                    //     MaterialPageRoute(
                                                                    //         builder: (BuildContext context) =>
                                                                    //             Cart(uid: '${widget.uid}')));
                                                                  } else {
                                                                    showsnack1(
                                                                        context);
                                                                  }
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                      'Add to cart',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                )),
                                                          ),
                                                        ),
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

              // yaha se list hataya
            ],
          ),
        ));
  }
}
