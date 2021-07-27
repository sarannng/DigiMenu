import 'dart:async';

import 'package:Cafe_Manager/Menu/menu.dart';
import 'package:Cafe_Manager/index/index.dart';
import 'package:Cafe_Manager/login/authservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}


 

class _LoginState extends State<Login> {
final _controller = TextEditingController();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  StreamSubscription iosSubscription;
  final formKey = new GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;
  @override
  Future<void> initState() {
    super.initState();
    // if (Platform.isIOS) {
    //     iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
    //         // save the token  OR subscribe to a topic here
    //     });

    //     _fcm.requestNotificationPermissions(IosNotificationSettings());
    // }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );

    //  _saveDeviceToken();
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 120),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
  
// @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp().whenComplete(() { 
//       print("completed");
//       setState(() {});
//     });
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.lightBlue, Colors.indigo],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Digi Menu',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              textAlign: TextAlign.center,
            ),

           //code for OTP

                  Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 25.0, right: 25.0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    hintText: 'Enter phone number'),
                                onChanged: (val) {
                                  setState(() {
                                    this.phoneNo =
                                        '+91${val.replaceAll(' ', '').trim()}';
                                  });
                                },
                              )),
                          codeSent
                              ? Padding(
                                  padding:
                                      EdgeInsets.only(left: 25.0, right: 25.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    decoration:
                                        InputDecoration(hintText: 'Enter OTP'),
                                    onChanged: (val) {
                                      setState(() {
                                        this.smsCode = val;
                                      });
                                    },
                                  ))
                              : Container(),
                          Padding(
                              padding: EdgeInsets.only(left: 25.0, right: 25.0),
                              child: RaisedButton(
                                  child: Center(
                                      child: codeSent
                                          ? Text('Login')
                                          : Text('Verify')),
                                  onPressed: () async {
                                    var _phoneNo= phoneNo.replaceAll('+', '');
                                    if(phoneNo!=null){
                                       await FirebaseFirestore.instance
                                          .collection('contacts')
                                          .doc('$_phoneNo')
                                          // .collection('${number.text}')
                                          //.doc('${number.text}')
                                          .set({
                                        'own_number': '$_phoneNo',
                                      });
                                    }

                                    codeSent
                                        ? () async {
                                          print('phone'+ phoneNo);
                                          if(phoneNo!= null){
                                        await FirebaseFirestore.instance
                                          .collection('contacts')
                                          .doc('91$phoneNo')
                                          // .collection('${number.text}')
                                          //.document('${number.text}')
                                          .set({
                                        'own_number': '91$phoneNo',
                                      });

                                                      

                                      await AuthService().signInWithOTP(
                                            smsCode, verificationId);

      //                                       Navigator.pushReplacement(
      // context, MaterialPageRoute(builder: (BuildContext context) => Index()));

      //                                   Navigator.pushReplacement(
      // context, MaterialPageRoute(builder: (BuildContext context) => SignupDetails(phone: phoneNo)));
      //                               Navigator.pushReplacement(
      // context, MaterialPageRoute(builder: (BuildContext context) => Index()));


                                     }}
                                        :verifyPhone(phoneNo);
                                        
                                        //  () async {
                                        //   verifyPhone(phoneNo);
                                        //   await AuthService().signInWithOTP(
                                        //     smsCode, verificationId);
                                        //   };
//==================Changed
                                // await FirebaseAuth.instance
                                //         .currentUser()
                                //         .then((value) async {
                                     

                                //       if (value != null) {
                                //         Navigator.of(context).pop();
                                //         // Navigator.of(context).pushReplacement(
                                //         //     MaterialPageRoute(
                                //         //         builder:
                                //         //             (BuildContext context) =>
                                //         //                 SignupDetails(phone: _phoneNo,)));
                                //       } else {
                                //         // Navigator.of(context).pop();
                                //         print('sdf');
                                //       }
                                //     }
                                //     );
                                  })),

                          //       Padding(
                          // padding: EdgeInsets.only(left: 25.0, right: 25.0),
                          // child: RaisedButton(
                          //     child: Center(child: codeSent ? Text('Login'):Text('Verify')),
                          //     onPressed: () {
                          //       codeSent ? AuthService().signInWithOTP(smsCode, verificationId): (){};
                          //     }))
                        ],
                      )),
           //===============================OTP CODE ENDS

          //  TextField starts//
          //   SizedBox(height: 30),
          //   Container(
          //     padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
          //     child: TextField(
          //       decoration: new InputDecoration(
          //           border: new OutlineInputBorder(
          //             borderRadius: const BorderRadius.all(
          //               const Radius.circular(10.0),
          //             ),
          //           ),
          //           filled: true,
          //           hintStyle: GoogleFonts.poppins(
          //               textStyle:
          //                   TextStyle(color: Colors.grey[800], fontSize: 15)),
          //           hintText: "Email",
          //           fillColor: Colors.white),
          //     ),
          //   ),
          //   Container(
          //     padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          //     child: TextField(
          //       obscureText: true,
          //       decoration: new InputDecoration(
                   
          //           border: new OutlineInputBorder(
          //             borderRadius: const BorderRadius.all(
          //               const Radius.circular(10.0),
          //             ),
          //           ),
          //           filled: true,
          //           hintStyle: GoogleFonts.poppins(
          //               textStyle:
          //                   TextStyle(color: Colors.grey[800], fontSize: 15)),
          //           hintText: "Password",
          //           fillColor: Colors.white),
          //     ),
          //   ),

          //   SizedBox(height: 20,),
          //  Row(
          //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //    children: [
          //      Container(
          //    decoration: BoxDecoration(
          //      borderRadius: BorderRadius.circular(90)
          //    ),
          //   // padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
          //    child:  RaisedButton(

          //     elevation: 10,
          //        color: Colors.lightBlue,
          //        child: Text('Login', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)),
          //       onPressed: () {
          //     FirebaseFirestore.instance.collection('test').doc('sarang').set({ 
          //       's': 's'
          //     });
          //         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Index()));
          //       }),
          //  ),

          //  Container(
          //    decoration: BoxDecoration(
          //      borderRadius: BorderRadius.circular(90)
          //    ),
          //    //padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
          //    child:  RaisedButton(

          //     elevation: 10,
          //        color: Colors.lightBlue,
          //        child: Text('Signup', style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)),
          //       onPressed: () {}),
          //  ),
          //    ],
          //  )
          // // txt field ends//
          
          ],
        ),
      ),
    );
  }
}
