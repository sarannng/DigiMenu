import 'package:Cafe_Manager/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: [
           Expanded(
             child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
   
           Text('Welcome aboard!', style: GoogleFonts.raleway(color: Colors.black45, fontSize: 24, fontWeight: FontWeight.w500),),

             SizedBox(height: 15,),
         

            //  Image.network('https://www.hrtrails.in/img/home/logo1.png'),
//15.7.20 Commtrails image to be set here 
               SizedBox(height: 15,),


                      
],
       ),
     
           ),


           
                 Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: RaisedButton(
                    color: Colors.blueAccent,
                      child: Center(child: Text('Next', style: TextStyle(color: Colors.white),)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                      }))
         ],
       )
    );
  }
}