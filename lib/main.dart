import 'dart:async';

import 'package:family_expenses/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'registration.dart';
import 'package:family_expenses/Animation/FadeAnimation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      //home: MyHomePage(),
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5, 0.9],
                colors: [
                  Color(0xFF9E7BFF),
                  Color(0xFF7A5DC7),
                  Color(0xFF6C2DC7),
                ],
              ),
            ),
          ),
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
                        backgroundColor: Colors.white,
                        radius: 50,
                      ),
                      SizedBox(height: 10,),
                      Text("Family Expenses",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
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
                      style: TextStyle(color: Colors.white, fontSize: 18, ),
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

    final width1=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5, 0.9],
                colors: [
                  Color(0xFF9E7BFF),
                  Color(0xFF7A5DC7),
                  Color(0xFF6C2DC7),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height:300,
                        width: 350,
                        child: SvgPicture.asset('assets/icons/family_.svg'),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: RichText(
                            text: TextSpan(text: 'Welcome', style: TextStyle(color: Colors.white,fontSize: 36, fontFamily: 'Teko',fontWeight: FontWeight.w400),
                              children: <TextSpan>[
                                TextSpan(text: '\n to family expenses',style: TextStyle(color: Colors.white,fontSize: 20, )),
                              ],),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                "Sign In", style: TextStyle(color: Colors.black, fontSize: 24,fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
                              ),
                              InkWell(
                                onTap: ()
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      stops: [0.1, 0.7],
                                      colors: [
                                        Color(0xFFF75D59),
                                        Color(0xFFF62817),
                                      ],
                                    ),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                  child: Icon(
                                      Icons.arrow_forward,
                                      size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 7.5,),
                        Text('-OR-', style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w400),),
                        SizedBox(height: 7.5,),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: <Widget>[
                               InkWell(
                                 onTap: ()
                                 {
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
                                 },
                                 child: Container(
                                   alignment: Alignment.center,
                                   width: 100,
                                   height: 50,
                                   decoration: BoxDecoration(
                                     gradient: LinearGradient(
                                       begin: Alignment.centerLeft,
                                       end: Alignment.centerRight,
                                       stops: [0.1, 0.7],
                                       colors: [
                                         Color(0xFFF87217),
                                         Color(0xFFFBB917),
                                       ],
                                     ),
                                     shape: BoxShape.rectangle,
                                     borderRadius: BorderRadius.all(Radius.circular(25))
                                    ),
                                   child: Icon(
                                     Icons.arrow_back,
                                     size: 30,
                                   ),

                                 ),
                               ),
                               Text(
                                 "Sign Up", style: TextStyle(color: Colors.black, fontSize: 24,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
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
