import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_expenses/DataBase/database_create.dart';
import 'package:family_expenses/Pages/profile.dart';
import 'package:family_expenses/Pages/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';


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
  bool _rememberMe = true;
  final formKey = GlobalKey<FormState>();
  String email, password, error='', userUid, name , image;
  Map<String, dynamic> userData;

  UserAuthentication _userAuthentication=UserAuthentication();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width1 = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(193, 214, 233, 0.85),
        body: Form(
          key: formKey,
        child: ListView(
          children:[
            Container(
              alignment: Alignment.centerRight,
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

                            ),

                        ),
                        Positioned(
                          bottom: 20,
                          left: 25,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child:RichText(
                                text: TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                      fontFamily: "Teko"
                                  ),
                                ),
                              ),
                            ),
                          ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor:Color.fromRGBO(49, 39, 79, 1),
                      style: TextStyle(
                          color: Color.fromRGBO(49, 39, 79, 1),
                          fontSize: 20),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white54,
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:BorderSide(color: Color.fromRGBO(49, 39, 79, 1),width: 2)
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:BorderSide(color: Color.fromRGBO(49, 39, 79, 1),width: 2)

                          ),
                          errorBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                              //borderSide:BorderSide(color: Color.fromRGBO(49, 39, 79, 1),width: 2)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                              //borderSide:BorderSide(color: Color.fromRGBO(49, 39, 79, 1),width: 2)
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(49, 39, 79, 1)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color.fromRGBO(49, 39, 79, 1),
                            size: 24,
                          )),
                        validator: (value) {
                        final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                        final regExp = RegExp(pattern);

                        if (value.isEmpty) {
                          return 'Enter an email';
                        } else if (!regExp.hasMatch(value)) {
                          return 'Enter a valid email';
                        } else {
                          return null;
                        }
                      },
                      //keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => setState(() => email = value),

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Color.fromRGBO(49, 39, 79, 1),
                        style: TextStyle(
                            color: Color.fromRGBO(49, 39, 79, 1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:BorderSide(color: Color.fromRGBO(49, 39, 79, 1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:BorderSide(color: Color.fromRGBO(49, 39, 79, 1),width: 2)
                            ),
                            errorBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                              //borderSide:BorderSide(color: Color.fromRGBO(49, 39, 79, 1),width: 2)
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                              //borderSide:BorderSide(color: Color.fromRGBO(49, 39, 79, 1),width: 2)
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(49, 39, 79, 1),),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromRGBO(49, 39, 79, 1),
                              size: 24,
                            )),
                        validator: (val) => val.length < 8 ? 'Enter a password 6+ chars long' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },

                      ),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //     padding: EdgeInsets.only(right: 25),
                  //     child: Align(
                  //       alignment: Alignment.centerRight,
                  //       child: Text(
                  //         "Forget password?",
                  //         style: TextStyle(
                  //             color: Color.fromRGBO(49, 39, 79, 1),
                  //             fontSize: 24,
                  //             fontWeight: FontWeight.w400,
                  //             fontFamily: "Teko"),
                  //       ),
                  //     ),
                  //
                  // ),
                  SizedBox(
                    height: 10,
                  ),
              // Container(
              //       width: width1,
              //       alignment: Alignment.center,
              //       padding: EdgeInsets.only(left: 20),
              //       child: Row(
              //         children: <Widget>[
              //           Theme(
              //             data: ThemeData(unselectedWidgetColor: Colors.white),
              //             child: Checkbox(
              //               value: _rememberMe,
              //               checkColor: Color.fromRGBO(49, 39, 79, 1),
              //               activeColor: Colors.white,
              //               onChanged: (value) {
              //                 setState(() {
              //                   _rememberMe = value;
              //                 });
              //               },
              //             ),
              //           ),
              //           Text(
              //             "Remember me",
              //             style: TextStyle(color: Colors.white, fontSize: 24,fontFamily: "Teko"),
              //           )
              //         ],
              //       ),
              //     ),

                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width:190,
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 6.0,
                                      offset: Offset(5, 5))
                                ],
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 45,width: 150,
                                    child: RaisedButton(onPressed: (){
                                    final isValid = formKey.currentState.validate();

                                    if (isValid) {
                                      formKey.currentState.save();
                                      _userAuthentication.signInUser(
                                          email, password);

                                      FirebaseAuth.instance
                                          .authStateChanges()
                                          .listen((User user) {
                                        if (user == null) {
                                          print('User is currently signed out!');
                                        } else {
                                          userUid=user.uid;
                                          print(userUid);

                                          FirebaseFirestore.instance.collection('users').doc(userUid).get()
                                              .then((DocumentSnapshot documentSnapshot) {
                                            if(documentSnapshot.exists)
                                            {
                                              userData = documentSnapshot.data() as Map<String, dynamic>;
                                              name=userData['FirstName']+' '+userData['LastName'];
                                              image=userData['Image'];
                                              Navigator.push(context, new MaterialPageRoute(builder: (context) => ProfilePage(name, image)));


                                            }
                                          });
                                        }
                                      });
                                     }
                                    },
                                      //padding: EdgeInsets.symmetric(vertical: 2,horizontal: 50),
                                      color: Colors.deepOrange[500],
                                      highlightElevation: 20,
                                      highlightColor: Colors.deepOrangeAccent.shade100,
                                      //splashColor: Colors.black54,
                                      splashColor:  Color.fromRGBO(193, 214, 233, 0.85),
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:Radius.circular(0),bottomRight: Radius.circular(50),bottomLeft: Radius.circular(10), )),
                                      child: Text("Login",style: TextStyle(color:
                                      Colors.white, fontSize: 28,fontFamily: "Teko", fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.thumb_up_off_alt,size: 30,color: Colors.black,)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                                  Text(error),
                                  SizedBox(height: 5,),
                          //         Text(
                          //         "-OR-",
                          //         style: TextStyle(color:
                          //          Colors.black87, fontSize: 28,fontFamily: "Teko"),
                          // ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // Text(
                          //   "Login with",
                          //   style: TextStyle(color: Colors.black87, fontSize: 32,fontFamily: "Teko"),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: <Widget>[
                          //     Container(
                          //       height: 45,
                          //       width: 45,
                          //       decoration: BoxDecoration(
                          //           //shape: BoxShape.circle,
                          //         borderRadius: BorderRadius.circular(5),
                          //           color: Colors.white,
                          //           boxShadow: [
                          //             BoxShadow(
                          //                 color: Colors.black26,
                          //                 blurRadius: 6.0,
                          //                 offset: Offset(5, 5))
                          //           ],
                          //           image: DecorationImage(
                          //             image: AssetImage(
                          //                 'assets/images/facebook.png'),
                          //           )),
                          //     ),
                          //     Container(
                          //       height: 45,
                          //       width: 45,
                          //       decoration: BoxDecoration(
                          //           //shape: BoxShape.circle,
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.circular(5),
                          //           boxShadow: [
                          //             BoxShadow(
                          //                 color: Colors.black26,
                          //                 blurRadius: 6.0,
                          //                 offset: Offset(5, 5))
                          //           ],
                          //           image: DecorationImage(
                          //             image:
                          //                 AssetImage('assets/images/google.png'),
                          //           )),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 15,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text(
                                'New user?',
                                style: TextStyle(color: Color.fromRGBO(39, 49, 79, 1),
                                fontSize: 30, fontFamily: 'Teko',fontWeight: FontWeight.w400)),
                              InkWell(
                                onTap: ()
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
                                },
                                child: Text(' Register',style: TextStyle(color: Colors.redAccent[700],
                                  fontFamily: 'Teko',fontSize: 30, )),
                              )
                            ],

                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      )),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
