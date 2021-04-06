import 'package:Cafe_Manager/Menu/menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrscan/qrscan.dart' as scanner;
class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Digi Menu',
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
            gradient: LinearGradient(colors: [Colors.lightBlue, Colors.indigo]),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient( 
                        colors: [Colors.lightBlue, Colors.indigo]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        //Scanning items row starts
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //1st Scanning circular avatar starts
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black26,
                                  //backgroundImage: NetworkImage('url'),
                                  radius: 30,
                                  child: Icon(
                                    Icons.local_offer,
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  'Offers',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      //fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //2st Scanning circular avatar starts
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black26,
                                  //backgroundImage: NetworkImage('url'),
                                  radius: 30,
                                  child: Icon(
                                    Icons.location_on,
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  'Nearby',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      //fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //3st Scanning circular avatar starts

                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black26,
                                  //backgroundImage: NetworkImage('url'),
                                  radius: 30,
                                  child: Icon(
                                    Icons.fastfood,
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  'Order',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      //fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //4st Scanning circular avatar starts

                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black26,
                                  //backgroundImage: NetworkImage('url'),
                                  radius: 30,
                                  child: Icon(
                                    Icons.event_note,
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  'Events',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      //fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // SizedBox(height: 10,),

                      //Ads block / white container.
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            //borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    autoPlay: true),
                                items: [
                                  'https://firebasestorage.googleapis.com/v0/b/jeevika-customer.appspot.com/o/123.jpeg?alt=media&token=2d103614-3def-4ae0-97c2-d9d8a6c32811',
                                  'https://firebasestorage.googleapis.com/v0/b/jeevika-customer.appspot.com/o/124.jpeg?alt=media&token=5ee814c7-2585-4ba6-9fd5-995ac2d0f5600',
                                  'https://firebasestorage.googleapis.com/v0/b/jeevika-customer.appspot.com/o/125.jpeg?alt=media&token=d858349c-fea1-4276-ac50-ae93045c996d'
                                ].map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          // decoration: BoxDecoration(
                                          //     color: Colors.blueAccent[100]),
                                          child: Image.network('$i'));
                                    },
                                  );
                                }).toList(),
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          'Recommeded for you!',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Card(
                                        elevation: 10,
                                        color: Colors.white,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Image.network(
                                                'https://b.zmtcdn.com/data/pictures/chains/9/18874089/fb6a87a99268cb4ae331a7a12184cc5e.jpeg?output-format=webp&fit=around|1029:555&crop=1029:555;*,*',
                                                height: 75,
                                                width: 150,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // ratings bar
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.stars,
                                                          color: Colors
                                                              .amberAccent,
                                                        ),
                                                        Text(
                                                          '4.5',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            11,
                                                  ),
                                                  //location bar
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          color:
                                                              Colors.redAccent,
                                                        ),
                                                        Text(
                                                          '2.3Km',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text('ShoSha Cafebar\nRestaurent',
                                                  overflow: TextOverflow.clip,
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          0, 87, 130, 1),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      // 2nd card

                                      Card(
                                        elevation: 10,
                                        color: Colors.white,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Image.network(
                                                'https://b.zmtcdn.com/data/pictures/chains/5/18973505/4debad1dbd28f3e81ad734668aa6e9ad.jpg?output-format=webp&fit=around|1029:555&crop=1029:555;*,*',
                                                height: 75,
                                                width: 150,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // ratings bar
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.stars,
                                                          color: Colors
                                                              .amberAccent,
                                                        ),
                                                        Text(
                                                          '4.8',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            11,
                                                  ),
                                                  //location bar
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          color:
                                                              Colors.redAccent,
                                                        ),
                                                        Text(
                                                          '4.3Km',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                  'Farzi Restaurent\nVijay nagar',
                                                  overflow: TextOverflow.clip,
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          0, 87, 130, 1),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Scan QR button in the bottom
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () async {

                              String cameraScanResult = await scanner.scan();
print(cameraScanResult);
if(cameraScanResult!=null){
     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Menu(qr: cameraScanResult,)));
                           
}
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text(
                                    'Scan QR',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Color.fromRGBO(0, 87, 130, 1),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.mobile_screen_share,
                                    color: Color.fromRGBO(0, 87, 130, 1),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
