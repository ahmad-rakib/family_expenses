import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:family_expenses/Animation/FadeAnimation.dart';
import 'main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  bool _rememberMe = true;

  @override
  void initState() {
    _animationController=AnimationController(
      vsync: this,
      duration: Duration(microseconds: 1000)
    );
    Timer(Duration(microseconds: 200),() =>_animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width1 = MediaQuery.of(context).size.width;
    final height1 = MediaQuery.of(context).size.height;

//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//    ));

    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF79BAEC),
        body: SafeArea(
          child: SingleChildScrollView(
      child: Column(
          children: <Widget>[
            Container(
              height: height1+30,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.4, 0.7, 0.9],
                    colors: [
                      Color(0xFF3594DD),
                      Color(0xFF4563DB),
                      Color(0xFF5036D5),
                      Color(0xFF5B16D0),
                    ],
                  ),
              ),
              //color: Color(0xff21254A),

              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            child:Container(
                              height: 300,
                              width: width1 + 10,
                              child: Image(
                                image: AssetImage('assets/images/top_login.png'),
                                fit: BoxFit.fill,
                              ),
                            ),

                        ),
                        Positioned(
                          top: 25,
                          left: 20,
                          child: FadeAnimation(1.1, InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseRoute()));
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.5),
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                                child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Color.fromRGBO(49, 39, 79, 1).withOpacity(0.75),
                                    size: 24,
                                  ),
                              ),
                            ),
                          ),
                          ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: FadeAnimation(1.1, RichText(
                                text: TextSpan(
                                  text: "Sign In",
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Color.fromRGBO(49, 39, 79, 1),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(1.35,Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(5, 5))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: TextField(
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Color.fromRGBO(39, 49, 79, .7),
                            style: TextStyle(
                                color: Color.fromRGBO(39, 49, 79, .7),
                                fontSize: 20),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(39, 49, 79, .7)),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color.fromRGBO(39, 49, 79, .7),
                                  size: 24,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(1.35,Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(5, 5))
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: TextField(
                            obscureText: true,
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Color.fromRGBO(39, 49, 79, .7),
                            style: TextStyle(
                                color: Color.fromRGBO(39, 49, 79, .7),
                                fontSize: 20),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(39, 49, 79, .7)),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color.fromRGBO(39, 49, 79, .7),
                                  size: 24,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(1.5, Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget password?",
                          style: TextStyle(
                              color: Color.fromRGBO(39, 49, 79, 1),
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
              FadeAnimation(1.6,Container(
                    width: width1,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                            value: _rememberMe,
                            checkColor: Color.fromRGBO(39, 49, 79, 1),
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value;
                              });
                            },
                          ),
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
              ),
                  SizedBox(
                    height: 10,
                  ),
              FadeAnimation(2.3,Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 200,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(49, 39, 79, 1),
                              //color: Colors.purple[900],
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Text(
                              "Login  ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "-OR-",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sign in with",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6.0,
                                          offset: Offset(0, 2))
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/facebook.png'),
                                    )),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6.0,
                                          offset: Offset(0, 2))
                                    ],
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/google.png'),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      )),
              ),
                ],
              ),
            ),
          ],
      ),
    ),
        ));
  }
}
