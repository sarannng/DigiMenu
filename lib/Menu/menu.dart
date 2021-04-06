import 'dart:convert';

 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {

final String qr;
  Menu({Key key, this.qr}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}
 List<TextEditingController> flexContainer1 = new List();

class _MenuState extends State<Menu> {
  
  String cafename;

// @override
// void initState() { 
//   var tem= FirebaseFirestore.instance.collection('/root/1/${widget.qr}').snapshots();
//   tem.listen((event) { setState(() {
//     cafename=event.docs.first.data()['cafeName'];});
//   }); 
// }


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
      
    }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  String PickerData = '''
[
    {
        "a": [
            {
                "a1": [
                    1,
                    2,
                    3,
                    4
                ]
            },
            {
                "a2": [
                    5,
                    6,
                    7,
                    8
                ]
            },
            {
                "a3": [
                    9,
                    10,
                    11,
                    12
                ]
            }
        ]
    },
    {
        "b": [
            {
                "b1": [
                    11,
                    22,
                    33,
                    44
                ]
            },
            {
                "b2": [
                    55,
                    66,
                    77,
                    88
                ]
            },
            {
                "b3": [
                    99,
                    1010,
                    1111,
                    1212
                ]
            }
        ]
    },
    {
        "c": [
            {
                "c1": [
                    "a",
                    "b",
                    "c"
                ]
            },
            {
                "c2": [
                    "aa",
                    "bb",
                    "cc"
                ]
            },
            {
                "c3": [
                    "aaa",
                    "bbb",
                    "ccc"
                ]
            }
        ]
    }
]
    ''';
  Widget build(BuildContext context) {


    

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            '$cafename',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
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
                                      child: InkWell(
                                        onTap: () {
                                          //   contcolor(1);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          child: Container(
                                            height: 36,
                                            decoration: BoxDecoration(
                                              //     color: c1,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      184, 178, 178, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Snacks',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          // contcolor(2);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          child: Container(
                                            height: 36,
                                            decoration: BoxDecoration(
                                              //   color: c2,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      184, 178, 178, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Veg Food',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          //  contcolor(3);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          child: Container(
                                            height: 36,
                                            decoration: BoxDecoration(
                                              //  color: c3,
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      184, 178, 178, 1)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Starter',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {},
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
                                                'Dessert',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {},
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
                                                'Special',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {},
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
                                                'More',
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                  )),

  //start

           Expanded(
                  flex: 3,
                  //yaha se hatana chalu kia
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('/root/1/menu/${widget.qr}/items')
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
                                Image.network(
                                  'https://cdn.pixabay.com/photo/2017/07/13/16/07/monkey-2500919_1280.jpg',
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
                            children: snapshot.data.docs
                                .asMap()
                                .map((index, value) {
                                  flexContainer1
                                      .add(new TextEditingController());

                                  return MapEntry(
                                      index,
                                       Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [Colors.lightBlue, Colors.indigo]),
                        ),
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 8,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 0.2, color: Colors.black38)),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  border: Border.all(
                                                      width: 0.2,
                                                      color: Colors.black38)),
                                              //  color: Colors.amber,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                 value.data()['itemImg'],
                                                  //'https://b.zmtcdn.com/data/pictures/chains/5/18973505/4debad1dbd28f3e81ad734668aa6e9ad.jpg?output-format=webp&fit=around|1029:555&crop=1029:555;*,*',
                                                  height: 100,
                                                  width: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                          // Container(
                                          //   //  padding: EdgeInsets.all(4),
                                          //   child:

                                          //-================================Post image
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 5,
                                              ),
                                              // Text(
                                              //   // value['item'],
                                              //   'item',
                                              //   style: TextStyle(
                                              //       fontWeight: FontWeight.bold),
                                              //   textAlign: TextAlign.center,
                                              // ),

                                              SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                // 'Choco ' +
                                                      value.data()['itemHeading'].toString(),
                                                    // 'Fudge'.toString() +
                                                    // '',

                                                    textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                  
                                                  textStyle: TextStyle(
                                                    color: Colors.redAccent,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),


// new Container(
//        child: Row(
//          children: <Widget>[
//             Flexible(
//                child: new Text( value.data()['itemDesc']))
//                 ],
//         )),
                                              Text(
                                                value.data()['itemDesc'],
                                             //   'White chocolate founded with freshly \nprepared caked blended with caremel\n for added taste',
                                                maxLines: 3,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.clip,
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),

                                              Row(
                                                children: [
                                                  InkWell(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              0, 87, 130, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      margin: EdgeInsets.only(
                                                          bottom: 5, top: 5),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'Add to Cart',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.shopping_cart,
                                                            color: Colors.white,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      print('object');

                                                      showPickerModal(
                                                          BuildContext
                                                              context) {
                                                        new Picker(
                                                            adapter: PickerDataAdapter<
                                                                    String>(
                                                                pickerdata:
                                                                    new JsonDecoder()
                                                                        .convert(
                                                                            PickerData)),
                                                            changeToFirst: true,
                                                            hideHeader: true,
                                                            onConfirm: (Picker
                                                                    picker,
                                                                List value) {
                                                              print(value
                                                                  .toString());
                                                              print(picker
                                                                  .adapter
                                                                  .text);
                                                            }).showModal(this.context); //_scaffoldKey.currentState);
                                                      }

                                                      //showPickerModal(context);
                                                      void
                                                          _modalBottomSheetMenu() {
                                                        showModalBottomSheet(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20),
                                                              ),
                                                            ),
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            context: context,
                                                            builder: (builder) {
                                                              return new Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            200),
                                                                    color: Colors
                                                                        .white),
                                                                height: 100.0,
                                                                //color: Colors.transparent, //could change this to Color(0xFF737373),
                                                                //so you don't have to change MaterialApp canvasColor
                                                                child:
                                                                    new Container(
                                                                        decoration: new BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius: new BorderRadius.only(topLeft: const Radius.circular(50.0), topRight: const Radius.circular(50.0))),
                                                                        child: Column(
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  'Quantity',
                                                                                  style: GoogleFonts.poppins(color: Colors.redAccent, fontWeight: FontWeight.w500, fontSize: 20),
                                                                                )
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [

                                                                                
                                                                              ],
                                                                            ),
                                                                            InkWell(
                                                                              child: Container(
                                                                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                                                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                                                                width: MediaQuery.of(context).size.width,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                  gradient: LinearGradient(colors: [
                                                                                    Colors.lightBlue,
                                                                                    Colors.indigo
                                                                                   ]),
                                                                                ),
                                                                                child: Text(
                                                                                  'Add to Cart',
                                                                                  textAlign: TextAlign.center,
                                                                                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        )),
                                                              );
                                                            });
                                                      }

                                                      _modalBottomSheetMenu();
                                                    },
                                                  )
                                                ],
                                              )

                                              //Quantity
                                              // Row(
                                              //   children: <Widget>[
                                              //     Container(
                                              //       decoration: BoxDecoration(),
                                              //       child: IconButton(
                                              //         icon: Icon(
                                              //           Icons.add,
                                              //           size: 15,
                                              //         ),
                                              //         onPressed: () {
                                              //           // setState(() {
                                              //           //   flexContainer1[index].text=  4.toString();
                                              //           // });
                                              //           // incrementC1Flex(
                                              //           //     index);
                                              //           // print(value
                                              //           //     .data
                                              //           //     .values);
                                              //         },
                                              //       ),
                                              //     ),
                                              //     Container(
                                              //       width: 20,
                                              //       child: TextField(
                                              //         // controller:
                                              //         //     flexContainer1[
                                              //         //         index],
                                              //         maxLength: 1,
                                              //         textAlign: TextAlign.center,
                                              //         readOnly: true,
                                              //       ),
                                              //     ),
                                              //     Container(
                                              //       child: IconButton(
                                              //         icon: Icon(Icons.minimize,
                                              //             size: 15),
                                              //         onPressed: () {
                                              //           // decrementC1Flex(
                                              //           //     index);
                                              //         },
                                              //       ),
                                              //     ),
                                              //   ],
                                              // )
                                            ],
                                          ),
                                          // ),

                                          /// Buttons
                                          // Column(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.center,
                                          //   children: <Widget>[
                                          //     Container(
                                          //       height: 30.0,
                                          //       decoration: BoxDecoration(
                                          //           borderRadius:
                                          //               BorderRadius.circular(10),
                                          //           color: Color.fromRGBO(
                                          //               255, 140, 64, 1),
                                          //           boxShadow: [
                                          //             BoxShadow(
                                          //               color: Colors.grey[500],
                                          //               offset: Offset(0.0, 1.5),
                                          //               blurRadius: 1.5,
                                          //             ),
                                          //           ]),
                                          //       child: Container(
                                          //         decoration: BoxDecoration(
                                          //           color: Colors.transparent,
                                          //         ),
                                          //         padding: EdgeInsets.all(8),
                                          //         child: InkWell(
                                          //             onTap: () {
                                          //               /////////////////////////////
                                          //               //   print(
                                          //               //       'bn tap');
                                          //               //   print(value
                                          //               //       .documentID);
                                          //               //   print(flexContainer1[
                                          //               //           index]
                                          //               //       .text);
                                          //               //   Navigator.push(
                                          //               //       context,
                                          //               //       MaterialPageRoute(
                                          //               //           builder: (BuildContext context) => Buypage(
                                          //               //               docid: value.documentID,
                                          //               //               quantitem: (flexContainer1[index].text))));
                                          //             },
                                          //             child: Center(
                                          //               child: Text(
                                          //                 'Buy now',
                                          //                 style: TextStyle(
                                          //                     color: Colors.white,
                                          //                     fontWeight:
                                          //                         FontWeight.bold),
                                          //               ),
                                          //             )),
                                          //       ),
                                          //     ),
                                          //     SizedBox(
                                          //       height: 8,
                                          //     ),
                                          //     Container(
                                          //       padding: EdgeInsets.all(8),
                                          //       height: 30.0,
                                          //       decoration: BoxDecoration(
                                          //           borderRadius:
                                          //               BorderRadius.circular(10),
                                          //           color: Color.fromRGBO(
                                          //               222, 199, 53, 1),
                                          //           boxShadow: [
                                          //             BoxShadow(
                                          //               color: Colors.grey[500],
                                          //               offset: Offset(0.0, 1.5),
                                          //               blurRadius: 1.5,
                                          //             ),
                                          //           ]),
                                          //       child: Material(
                                          //         color: Colors.transparent,
                                          //         child: InkWell(
                                          //             onTap: () {
                                          //               // print(
                                          //               //     'object');

                                          //               // if (flexContainer1[
                                          //               //             index]
                                          //               //         .text !=
                                          //               //     '') {
                                          //               //   Firestore
                                          //               //       .instance
                                          //               //       .collection(
                                          //               //           'user')
                                          //               //       .document(
                                          //               //           '${widget.uid}')
                                          //               //       .collection(
                                          //               //           'current_order')
                                          //               //       .document(
                                          //               //           '${widget.uid}')
                                          //               //       .collection(
                                          //               //           'cart')
                                          //               //       .document()
                                          //               //       .setData({
                                          //               //     'image':
                                          //               //         '${value['image']}',
                                          //               //     'price':
                                          //               //         '${value['price']}',
                                          //               //     'user_quant':
                                          //               //         '${flexContainer1[index].text}',
                                          //               //     'item':
                                          //               //         '${value['item']}'
                                          //               //   });
                                          //               //   showsnack(
                                          //               //       context);
                                          //               //   // Navigator.push(
                                          //               //   //     context,
                                          //               //   //     MaterialPageRoute(
                                          //               //   //         builder: (BuildContext context) =>
                                          //               //   //             Cart(uid: '${widget.uid}')));
                                          //               // } else {
                                          //               //   showsnack1(
                                          //               //       context);
                                          //               // }
                                          //             },
                                          //             child: Center(
                                          //               child: Text('Add to cart',
                                          //                   style: TextStyle(
                                          //                       color: Colors.white,
                                          //                       fontWeight:
                                          //                           FontWeight
                                          //                               .bold)),
                                          //             )),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    )
                                  ],
                                ))),
                      ),

                                      );
                                })
                                .values
                                .toList(),

                            //   }
                          );
                      }
                    },
                  )),


  //end




              // Expanded(
              //     flex: 3,
              //     //yaha se hatana chalu kia
              //     child: Column(
              //       children: [
              //         Container(
              //           margin: EdgeInsets.all(5),
              //           padding: EdgeInsets.all(5),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             gradient: LinearGradient(
              //                 colors: [Colors.lightBlue, Colors.indigo]),
              //           ),
              //           child: Card(
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(20),
              //               ),
              //               elevation: 8,
              //               child: Container(
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(20),
              //                       border: Border.all(
              //                           width: 0.2, color: Colors.black38)),
              //                   child: Column(
              //                     children: <Widget>[
              //                       Container(
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceEvenly,
              //                           children: <Widget>[
              //                             Container(
              //                                 decoration: BoxDecoration(
              //                                     borderRadius:
              //                                         BorderRadius.circular(50),
              //                                     border: Border.all(
              //                                         width: 0.2,
              //                                         color: Colors.black38)),
              //                                 //  color: Colors.amber,
              //                                 child: ClipRRect(
              //                                   borderRadius:
              //                                       BorderRadius.circular(10),
              //                                   child: Image.network(
              //                                     // value['image'],
              //                                     'https://b.zmtcdn.com/data/pictures/chains/5/18973505/4debad1dbd28f3e81ad734668aa6e9ad.jpg?output-format=webp&fit=around|1029:555&crop=1029:555;*,*',
              //                                     height: 100,
              //                                     width: 100,
              //                                     fit: BoxFit.cover,
              //                                   ),
              //                                 )),
              //                             // Container(
              //                             //   //  padding: EdgeInsets.all(4),
              //                             //   child:

              //                             //-================================Post image
              //                             Column(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceAround,
              //                               children: <Widget>[
              //                                 SizedBox(
              //                                   height: 5,
              //                                 ),
              //                                 // Text(
              //                                 //   // value['item'],
              //                                 //   'item',
              //                                 //   style: TextStyle(
              //                                 //       fontWeight: FontWeight.bold),
              //                                 //   textAlign: TextAlign.center,
              //                                 // ),

              //                                 SizedBox(
              //                                   height: 12,
              //                                 ),
              //                                 Text(
              //                                   'Choco ' +
              //                                       // value['price']
              //                                       'Fudge'.toString() +
              //                                       '',
              //                                   style: GoogleFonts.poppins(
              //                                     textStyle: TextStyle(
              //                                       color: Colors.redAccent,
              //                                       fontSize: 18,
              //                                       fontWeight: FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                 ),

              //                                 Text(
              //                                   'White chocolate founded with freshly \nprepared caked blended with caremel\n for added taste',
              //                                   maxLines: 3,
              //                                   textAlign: TextAlign.center,
              //                                   overflow: TextOverflow.clip,
              //                                   style: GoogleFonts.poppins(
              //                                     textStyle: TextStyle(
              //                                       color: Colors.black38,
              //                                       fontSize: 11,
              //                                       fontWeight: FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                   height: 8,
              //                                 ),

              //                                 Row(
              //                                   children: [
              //                                     InkWell(
              //                                       child: Container(
              //                                         decoration: BoxDecoration(
              //                                             color: Color.fromRGBO(
              //                                                 0, 87, 130, 1),
              //                                             borderRadius:
              //                                                 BorderRadius
              //                                                     .circular(5)),
              //                                         padding:
              //                                             EdgeInsets.all(5),
              //                                         margin: EdgeInsets.only(
              //                                             bottom: 5, top: 5),
              //                                         child: Row(
              //                                           children: [
              //                                             Text(
              //                                               'Add to Cart',
              //                                               style: GoogleFonts
              //                                                   .poppins(
              //                                                 textStyle:
              //                                                     TextStyle(
              //                                                   color: Colors
              //                                                       .white,
              //                                                   fontSize: 10,
              //                                                   fontWeight:
              //                                                       FontWeight
              //                                                           .w600,
              //                                                 ),
              //                                               ),
              //                                             ),
              //                                             Icon(
              //                                               Icons.shopping_cart,
              //                                               color: Colors.white,
              //                                             )
              //                                           ],
              //                                         ),
              //                                       ),
              //                                       onTap: () {
              //                                         print('object');

              //                                         showPickerModal(
              //                                             BuildContext
              //                                                 context) {
              //                                           new Picker(
              //                                               adapter: PickerDataAdapter<
              //                                                       String>(
              //                                                   pickerdata:
              //                                                       new JsonDecoder()
              //                                                           .convert(
              //                                                               PickerData)),
              //                                               changeToFirst: true,
              //                                               hideHeader: true,
              //                                               onConfirm: (Picker
              //                                                       picker,
              //                                                   List value) {
              //                                                 print(value
              //                                                     .toString());
              //                                                 print(picker
              //                                                     .adapter
              //                                                     .text);
              //                                               }).showModal(this.context); //_scaffoldKey.currentState);
              //                                         }

              //                                         //showPickerModal(context);
              //                                         void
              //                                             _modalBottomSheetMenu() {
              //                                           showModalBottomSheet(
              //                                               shape:
              //                                                   RoundedRectangleBorder(
              //                                                 borderRadius:
              //                                                     BorderRadius
              //                                                         .vertical(
              //                                                   top: Radius
              //                                                       .circular(
              //                                                           20),
              //                                                 ),
              //                                               ),
              //                                               clipBehavior: Clip
              //                                                   .antiAliasWithSaveLayer,
              //                                               context: context,
              //                                               builder: (builder) {
              //                                                 return new Container(
              //                                                   decoration: BoxDecoration(
              //                                                       borderRadius:
              //                                                           BorderRadius.circular(
              //                                                               200),
              //                                                       color: Colors
              //                                                           .white),
              //                                                   height: 100.0,
              //                                                   //color: Colors.transparent, //could change this to Color(0xFF737373),
              //                                                   //so you don't have to change MaterialApp canvasColor
              //                                                   child:
              //                                                       new Container(
              //                                                           decoration: new BoxDecoration(
              //                                                               color:
              //                                                                   Colors.white,
              //                                                               borderRadius: new BorderRadius.only(topLeft: const Radius.circular(50.0), topRight: const Radius.circular(50.0))),
              //                                                           child: Column(
              //                                                             children: [
              //                                                               Row(
              //                                                                 mainAxisAlignment: MainAxisAlignment.center,
              //                                                                 children: [
              //                                                                   Text(
              //                                                                     'Quantity',
              //                                                                     style: GoogleFonts.poppins(color: Colors.redAccent, fontWeight: FontWeight.w500, fontSize: 20),
              //                                                                   )
              //                                                                 ],
              //                                                               ),
              //                                                               Row(
              //                                                                 children: [

                                                                                
              //                                                                 ],
              //                                                               ),
              //                                                               InkWell(
              //                                                                 child: Container(
              //                                                                   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              //                                                                   margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              //                                                                   width: MediaQuery.of(context).size.width,
              //                                                                   decoration: BoxDecoration(
              //                                                                     borderRadius: BorderRadius.circular(10),
              //                                                                     gradient: LinearGradient(colors: [
              //                                                                       Colors.lightBlue,
              //                                                                       Colors.indigo
              //                                                                     ]),
              //                                                                   ),
              //                                                                   child: Text(
              //                                                                     'Add to Cart',
              //                                                                     textAlign: TextAlign.center,
              //                                                                     style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              //                                                                   ),
              //                                                                 ),
              //                                                               )
              //                                                             ],
              //                                                           )),
              //                                                 );
              //                                               });
              //                                         }

              //                                         _modalBottomSheetMenu();
              //                                       },
              //                                     )
              //                                   ],
              //                                 )

              //                                 //Quantity
              //                                 // Row(
              //                                 //   children: <Widget>[
              //                                 //     Container(
              //                                 //       decoration: BoxDecoration(),
              //                                 //       child: IconButton(
              //                                 //         icon: Icon(
              //                                 //           Icons.add,
              //                                 //           size: 15,
              //                                 //         ),
              //                                 //         onPressed: () {
              //                                 //           // setState(() {
              //                                 //           //   flexContainer1[index].text=  4.toString();
              //                                 //           // });
              //                                 //           // incrementC1Flex(
              //                                 //           //     index);
              //                                 //           // print(value
              //                                 //           //     .data
              //                                 //           //     .values);
              //                                 //         },
              //                                 //       ),
              //                                 //     ),
              //                                 //     Container(
              //                                 //       width: 20,
              //                                 //       child: TextField(
              //                                 //         // controller:
              //                                 //         //     flexContainer1[
              //                                 //         //         index],
              //                                 //         maxLength: 1,
              //                                 //         textAlign: TextAlign.center,
              //                                 //         readOnly: true,
              //                                 //       ),
              //                                 //     ),
              //                                 //     Container(
              //                                 //       child: IconButton(
              //                                 //         icon: Icon(Icons.minimize,
              //                                 //             size: 15),
              //                                 //         onPressed: () {
              //                                 //           // decrementC1Flex(
              //                                 //           //     index);
              //                                 //         },
              //                                 //       ),
              //                                 //     ),
              //                                 //   ],
              //                                 // )
              //                               ],
              //                             ),
              //                             // ),

              //                             /// Buttons
              //                             // Column(
              //                             //   mainAxisAlignment:
              //                             //       MainAxisAlignment.center,
              //                             //   crossAxisAlignment:
              //                             //       CrossAxisAlignment.center,
              //                             //   children: <Widget>[
              //                             //     Container(
              //                             //       height: 30.0,
              //                             //       decoration: BoxDecoration(
              //                             //           borderRadius:
              //                             //               BorderRadius.circular(10),
              //                             //           color: Color.fromRGBO(
              //                             //               255, 140, 64, 1),
              //                             //           boxShadow: [
              //                             //             BoxShadow(
              //                             //               color: Colors.grey[500],
              //                             //               offset: Offset(0.0, 1.5),
              //                             //               blurRadius: 1.5,
              //                             //             ),
              //                             //           ]),
              //                             //       child: Container(
              //                             //         decoration: BoxDecoration(
              //                             //           color: Colors.transparent,
              //                             //         ),
              //                             //         padding: EdgeInsets.all(8),
              //                             //         child: InkWell(
              //                             //             onTap: () {
              //                             //               /////////////////////////////
              //                             //               //   print(
              //                             //               //       'bn tap');
              //                             //               //   print(value
              //                             //               //       .documentID);
              //                             //               //   print(flexContainer1[
              //                             //               //           index]
              //                             //               //       .text);
              //                             //               //   Navigator.push(
              //                             //               //       context,
              //                             //               //       MaterialPageRoute(
              //                             //               //           builder: (BuildContext context) => Buypage(
              //                             //               //               docid: value.documentID,
              //                             //               //               quantitem: (flexContainer1[index].text))));
              //                             //             },
              //                             //             child: Center(
              //                             //               child: Text(
              //                             //                 'Buy now',
              //                             //                 style: TextStyle(
              //                             //                     color: Colors.white,
              //                             //                     fontWeight:
              //                             //                         FontWeight.bold),
              //                             //               ),
              //                             //             )),
              //                             //       ),
              //                             //     ),
              //                             //     SizedBox(
              //                             //       height: 8,
              //                             //     ),
              //                             //     Container(
              //                             //       padding: EdgeInsets.all(8),
              //                             //       height: 30.0,
              //                             //       decoration: BoxDecoration(
              //                             //           borderRadius:
              //                             //               BorderRadius.circular(10),
              //                             //           color: Color.fromRGBO(
              //                             //               222, 199, 53, 1),
              //                             //           boxShadow: [
              //                             //             BoxShadow(
              //                             //               color: Colors.grey[500],
              //                             //               offset: Offset(0.0, 1.5),
              //                             //               blurRadius: 1.5,
              //                             //             ),
              //                             //           ]),
              //                             //       child: Material(
              //                             //         color: Colors.transparent,
              //                             //         child: InkWell(
              //                             //             onTap: () {
              //                             //               // print(
              //                             //               //     'object');

              //                             //               // if (flexContainer1[
              //                             //               //             index]
              //                             //               //         .text !=
              //                             //               //     '') {
              //                             //               //   Firestore
              //                             //               //       .instance
              //                             //               //       .collection(
              //                             //               //           'user')
              //                             //               //       .document(
              //                             //               //           '${widget.uid}')
              //                             //               //       .collection(
              //                             //               //           'current_order')
              //                             //               //       .document(
              //                             //               //           '${widget.uid}')
              //                             //               //       .collection(
              //                             //               //           'cart')
              //                             //               //       .document()
              //                             //               //       .setData({
              //                             //               //     'image':
              //                             //               //         '${value['image']}',
              //                             //               //     'price':
              //                             //               //         '${value['price']}',
              //                             //               //     'user_quant':
              //                             //               //         '${flexContainer1[index].text}',
              //                             //               //     'item':
              //                             //               //         '${value['item']}'
              //                             //               //   });
              //                             //               //   showsnack(
              //                             //               //       context);
              //                             //               //   // Navigator.push(
              //                             //               //   //     context,
              //                             //               //   //     MaterialPageRoute(
              //                             //               //   //         builder: (BuildContext context) =>
              //                             //               //   //             Cart(uid: '${widget.uid}')));
              //                             //               // } else {
              //                             //               //   showsnack1(
              //                             //               //       context);
              //                             //               // }
              //                             //             },
              //                             //             child: Center(
              //                             //               child: Text('Add to cart',
              //                             //                   style: TextStyle(
              //                             //                       color: Colors.white,
              //                             //                       fontWeight:
              //                             //                           FontWeight
              //                             //                               .bold)),
              //                             //             )),
              //                             //       ),
              //                             //     ),
              //                             //   ],
              //                             // )
              //                           ],
              //                         ),
              //                       )
              //                     ],
              //                   ))),
              //         ),

              //         //2nd card starts
              //         Container(
              //           margin: EdgeInsets.all(5),
              //           padding: EdgeInsets.all(5),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             gradient: LinearGradient(
              //                 colors: [Colors.lightBlue, Colors.indigo]),
              //           ),
              //           child: Card(
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(20),
              //               ),
              //               elevation: 8,
              //               child: Container(
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(20),
              //                       border: Border.all(
              //                           width: 0.2, color: Colors.black38)),
              //                   child: Column(
              //                     children: <Widget>[
              //                       Container(
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceEvenly,
              //                           children: <Widget>[
              //                             Container(
              //                                 decoration: BoxDecoration(
              //                                     borderRadius:
              //                                         BorderRadius.circular(50),
              //                                     border: Border.all(
              //                                         width: 0.2,
              //                                         color: Colors.black38)),
              //                                 //  color: Colors.amber,
              //                                 child: ClipRRect(
              //                                   borderRadius:
              //                                       BorderRadius.circular(10),
              //                                   child: Image.network(
              //                                     // value['image'],
              //                                     'https://b.zmtcdn.com/data/pictures/chains/9/18874089/fb6a87a99268cb4ae331a7a12184cc5e.jpeg?output-format=webp&fit=around|1029:555&crop=1029:555;*,*',
              //                                     height: 100,
              //                                     width: 100,
              //                                     fit: BoxFit.cover,
              //                                   ),
              //                                 )),
              //                             // Container(
              //                             //   //  padding: EdgeInsets.all(4),
              //                             //   child:

              //                             //-================================Post image
              //                             Column(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceAround,
              //                               children: <Widget>[
              //                                 SizedBox(
              //                                   height: 5,
              //                                 ),
              //                                 // Text(
              //                                 //   // value['item'],
              //                                 //   'item',
              //                                 //   style: TextStyle(
              //                                 //       fontWeight: FontWeight.bold),
              //                                 //   textAlign: TextAlign.center,
              //                                 // ),

              //                                 SizedBox(
              //                                   height: 12,
              //                                 ),
              //                                 Text(
              //                                   'Kitty ' +
              //                                       // value['price']
              //                                       'Momos'.toString() +
              //                                       '',
              //                                   style: GoogleFonts.poppins(
              //                                     textStyle: TextStyle(
              //                                       color: Colors.redAccent,
              //                                       fontSize: 18,
              //                                       fontWeight: FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                 ),

              //                                 Text(
              //                                   'White chocolate founded with freshly \nprepared caked blended with caremel\n for added taste',
              //                                   maxLines: 3,
              //                                   textAlign: TextAlign.center,
              //                                   overflow: TextOverflow.clip,
              //                                   style: GoogleFonts.poppins(
              //                                     textStyle: TextStyle(
              //                                       color: Colors.black38,
              //                                       fontSize: 11,
              //                                       fontWeight: FontWeight.w600,
              //                                     ),
              //                                   ),
              //                                 ),
              //                                 SizedBox(
              //                                   height: 8,
              //                                 ),
              //                                 Container(
              //                                   decoration: BoxDecoration(
              //                                       color: Color.fromRGBO(
              //                                           0, 87, 130, 1),
              //                                       borderRadius:
              //                                           BorderRadius.circular(
              //                                               5)),
              //                                   padding: EdgeInsets.all(5),
              //                                   margin: EdgeInsets.only(
              //                                       bottom: 5, top: 5),
              //                                   child: Row(
              //                                     children: [
              //                                       Text(
              //                                         'Add to Cart',
              //                                         style:
              //                                             GoogleFonts.poppins(
              //                                           textStyle: TextStyle(
              //                                             color: Colors.white,
              //                                             fontSize: 10,
              //                                             fontWeight:
              //                                                 FontWeight.w600,
              //                                           ),
              //                                         ),
              //                                       ),
              //                                       Icon(
              //                                         Icons.shopping_cart,
              //                                         color: Colors.white,
              //                                       )
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 //Quantity
              //                                 // Row(
              //                                 //   children: <Widget>[
              //                                 //     Container(
              //                                 //       decoration: BoxDecoration(),
              //                                 //       child: IconButton(
              //                                 //         icon: Icon(
              //                                 //           Icons.add,
              //                                 //           size: 15,
              //                                 //         ),
              //                                 //         onPressed: () {
              //                                 //           // setState(() {
              //                                 //           //   flexContainer1[index].text=  4.toString();
              //                                 //           // });
              //                                 //           // incrementC1Flex(
              //                                 //           //     index);
              //                                 //           // print(value
              //                                 //           //     .data
              //                                 //           //     .values);
              //                                 //         },
              //                                 //       ),
              //                                 //     ),
              //                                 //     Container(
              //                                 //       width: 20,
              //                                 //       child: TextField(
              //                                 //         // controller:
              //                                 //         //     flexContainer1[
              //                                 //         //         index],
              //                                 //         maxLength: 1,
              //                                 //         textAlign: TextAlign.center,
              //                                 //         readOnly: true,
              //                                 //       ),
              //                                 //     ),
              //                                 //     Container(
              //                                 //       child: IconButton(
              //                                 //         icon: Icon(Icons.minimize,
              //                                 //             size: 15),
              //                                 //         onPressed: () {
              //                                 //           // decrementC1Flex(
              //                                 //           //     index);
              //                                 //         },
              //                                 //       ),
              //                                 //     ),
              //                                 //   ],
              //                                 // )
              //                               ],
              //                             ),
              //                             // ),

              //                             /// Buttons
              //                             // Column(
              //                             //   mainAxisAlignment:
              //                             //       MainAxisAlignment.center,
              //                             //   crossAxisAlignment:
              //                             //       CrossAxisAlignment.center,
              //                             //   children: <Widget>[
              //                             //     Container(
              //                             //       height: 30.0,
              //                             //       decoration: BoxDecoration(
              //                             //           borderRadius:
              //                             //               BorderRadius.circular(10),
              //                             //           color: Color.fromRGBO(
              //                             //               255, 140, 64, 1),
              //                             //           boxShadow: [
              //                             //             BoxShadow(
              //                             //               color: Colors.grey[500],
              //                             //               offset: Offset(0.0, 1.5),
              //                             //               blurRadius: 1.5,
              //                             //             ),
              //                             //           ]),
              //                             //       child: Container(
              //                             //         decoration: BoxDecoration(
              //                             //           color: Colors.transparent,
              //                             //         ),
              //                             //         padding: EdgeInsets.all(8),
              //                             //         child: InkWell(
              //                             //             onTap: () {
              //                             //               /////////////////////////////
              //                             //               //   print(
              //                             //               //       'bn tap');
              //                             //               //   print(value
              //                             //               //       .documentID);
              //                             //               //   print(flexContainer1[
              //                             //               //           index]
              //                             //               //       .text);
              //                             //               //   Navigator.push(
              //                             //               //       context,
              //                             //               //       MaterialPageRoute(
              //                             //               //           builder: (BuildContext context) => Buypage(
              //                             //               //               docid: value.documentID,
              //                             //               //               quantitem: (flexContainer1[index].text))));
              //                             //             },
              //                             //             child: Center(
              //                             //               child: Text(
              //                             //                 'Buy now',
              //                             //                 style: TextStyle(
              //                             //                     color: Colors.white,
              //                             //                     fontWeight:
              //                             //                         FontWeight.bold),
              //                             //               ),
              //                             //             )),
              //                             //       ),
              //                             //     ),
              //                             //     SizedBox(
              //                             //       height: 8,
              //                             //     ),
              //                             //     Container(
              //                             //       padding: EdgeInsets.all(8),
              //                             //       height: 30.0,
              //                             //       decoration: BoxDecoration(
              //                             //           borderRadius:
              //                             //               BorderRadius.circular(10),
              //                             //           color: Color.fromRGBO(
              //                             //               222, 199, 53, 1),
              //                             //           boxShadow: [
              //                             //             BoxShadow(
              //                             //               color: Colors.grey[500],
              //                             //               offset: Offset(0.0, 1.5),
              //                             //               blurRadius: 1.5,
              //                             //             ),
              //                             //           ]),
              //                             //       child: Material(
              //                             //         color: Colors.transparent,
              //                             //         child: InkWell(
              //                             //             onTap: () {
              //                             //               // print(
              //                             //               //     'object');

              //                             //               // if (flexContainer1[
              //                             //               //             index]
              //                             //               //         .text !=
              //                             //               //     '') {
              //                             //               //   Firestore
              //                             //               //       .instance
              //                             //               //       .collection(
              //                             //               //           'user')
              //                             //               //       .document(
              //                             //               //           '${widget.uid}')
              //                             //               //       .collection(
              //                             //               //           'current_order')
              //                             //               //       .document(
              //                             //               //           '${widget.uid}')
              //                             //               //       .collection(
              //                             //               //           'cart')
              //                             //               //       .document()
              //                             //               //       .setData({
              //                             //               //     'image':
              //                             //               //         '${value['image']}',
              //                             //               //     'price':
              //                             //               //         '${value['price']}',
              //                             //               //     'user_quant':
              //                             //               //         '${flexContainer1[index].text}',
              //                             //               //     'item':
              //                             //               //         '${value['item']}'
              //                             //               //   });
              //                             //               //   showsnack(
              //                             //               //       context);
              //                             //               //   // Navigator.push(
              //                             //               //   //     context,
              //                             //               //   //     MaterialPageRoute(
              //                             //               //   //         builder: (BuildContext context) =>
              //                             //               //   //             Cart(uid: '${widget.uid}')));
              //                             //               // } else {
              //                             //               //   showsnack1(
              //                             //               //       context);
              //                             //               // }
              //                             //             },
              //                             //             child: Center(
              //                             //               child: Text('Add to cart',
              //                             //                   style: TextStyle(
              //                             //                       color: Colors.white,
              //                             //                       fontWeight:
              //                             //                           FontWeight
              //                             //                               .bold)),
              //                             //             )),
              //                             //       ),
              //                             //     ),
              //                             //   ],
              //                             // )
              //                           ],
              //                         ),
              //                       )
              //                     ],
              //                   ))),
              //         ),
              //       ],
              //     ))
              // // yaha se list hataya
            ],
          ),
        ));
  }
}
