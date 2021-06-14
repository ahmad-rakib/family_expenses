import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'registration.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),()=>
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseRoute())));
  }

  @override
  Widget build(BuildContext context) {
    final height1=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 233, .85),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
         Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 50,
                        child: Icon(
                          MaterialIcons.apps
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Halnagad",
                        style: TextStyle(
                          color: Color.fromRGBO(39, 49, 79, 0.95),
                          fontSize: 48,
                          fontFamily: "Teko"
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(backgroundColor: Colors.yellow, strokeWidth: 3.5,),
                      SizedBox(height: 10,),
                      Text("A guide to ensure\nbetter family expense",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromRGBO(39, 49, 79, .95), fontFamily: "Teko",fontSize: 24, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}

class ChooseRoute extends StatefulWidget
{
  @override
  _ChooseRouteState createState() => _ChooseRouteState();
}

class _ChooseRouteState extends State<ChooseRoute>{


  @override
  Widget build(BuildContext context) {
    final height1=MediaQuery.of(context).size.height;
    final width1=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 233, 0.85),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height:height1*0.3,
                        width: width1+10,
                        child: SvgPicture.asset('assets/icons/family_.svg'),
                      ),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: RichText(
                            text: TextSpan(text: 'Welcome', style: TextStyle(color: Color.fromRGBO(39, 49, 79, 1),fontSize: 44, fontFamily: 'Teko',fontWeight: FontWeight.w400),
                              children: <TextSpan>[
                                TextSpan(text: '\n to family expenses',style: TextStyle(color: Color.fromRGBO(39, 49, 79, 1),fontSize: 30, )),
                              ],),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 50,
                              child: OutlineButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                              },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),

                                ),
                                highlightColor: Color.fromRGBO(193, 214, 233, .85),
                                splashColor: Colors.deepOrangeAccent,
                                highlightElevation: 0.5,
                                highlightedBorderColor: Colors.deepOrangeAccent,
                                  borderSide: BorderSide(width: 3.5, color: Colors.deepOrangeAccent,),
                                  child: Text(
                                    "Login", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 36,fontFamily: "Teko"),
                                  ),
                                ),
                                //borderSide: BorderSide(width: 3,color: Colors.deepOrangeAccent),
                            ),
                            SizedBox(
                              width: 160,
                              height: 50,
                              child: OutlineButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
                              },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),

                                ),
                                highlightColor: Color.fromRGBO(193, 214, 233, .85),
                                highlightElevation: 0.5,
                                splashColor:Color.fromRGBO(39, 49, 79, .95),
                                highlightedBorderColor: Color.fromRGBO(39, 49, 79, .95),
                                borderSide: BorderSide(width: 3.5, color: Color.fromRGBO(39, 49, 79, .95),),
                                child: Text(
                                  "Register", style: TextStyle(color: Color.fromRGBO(39, 49, 79, .95), fontSize: 36,fontFamily: "Teko"),
                                ),
                              ),
                              //borderSide: BorderSide(width: 3,color: Colors.deepOrangeAccent),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
