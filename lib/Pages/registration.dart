import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'profile.dart';
import 'main.dart';

class Registration extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }

}

class RegistrationPage extends StatefulWidget{
  @override
  _RegistrationPageRoute1 createState()=> _RegistrationPageRoute1();
}

class _RegistrationPageRoute1  extends State<RegistrationPage>{

  @override
  Widget build(BuildContext context) {
    width1: MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),

              child: Column(

                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseRoute()));
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.all(Radius.circular(3)),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        child: SvgPicture.asset('assets/icons/mobile_login.svg')
                      ),

                    ],
                  ),
                  SizedBox(height: 35,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color.fromRGBO(39, 49, 79, .7),
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Pacifico'
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                       padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(

                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.5)
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xFF6C63FF),
                                  style: TextStyle(
                                      color: Color(0xFF6C63FF),
                                      fontSize: 18),
                                  decoration: InputDecoration(
                                    labelText: 'First Name',
                                    labelStyle: TextStyle(fontSize: 16,color: Color(0xFF6C63FF),),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.5)
                                ),
                                child: TextField(
                                  cursorColor: Color(0xFF6C63FF),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      color: Color(0xFF6C63FF),
                                      fontSize: 18),
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    labelStyle: TextStyle(fontSize: 16,color: Color(0xFF6C63FF)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.5)
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xFF6C63FF),
                                  style: TextStyle(
                                      color: Color(0xFF6C63FF),
                                      fontSize: 18),
                                  decoration: InputDecoration(
                                    labelText: 'Gender',
                                    labelStyle: TextStyle(fontSize: 16,color: Color(0xFF6C63FF),),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.5)
                                ),
                                child: TextField(
                                  cursorColor: Color(0xFF6C63FF),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      color: Color(0xFF6C63FF),
                                      fontSize: 18),
                                  decoration: InputDecoration(
                                    labelText: 'Blood Group',
                                    labelStyle: TextStyle(fontSize: 16,color: Color(0xFF6C63FF)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)
                          ),
                          child: TextField(
                            cursorColor: Color(0xFF6C63FF),
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontSize: 18),
                            decoration: InputDecoration(
                              labelText: 'Address',
                              labelStyle: TextStyle(fontSize: 16,color: Color(0xFF6C63FF)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)
                          ),
                          child: TextField(
                            cursorColor: Color(0xFF6C63FF),
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontSize: 18),
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(fontSize: 16,color: Color(0xFF6C63FF)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)
                          ),
                          child: TextField(
                            cursorColor: Color(0xFF6C63FF),
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontSize: 18),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(fontSize: 16,color: Color(0xFF6C63FF)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)
                          ),
                          child: TextField(
                            obscureText: true,
                            cursorColor: Color(0xFF6C63FF),
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontSize: 18),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 16,color: Color(0xFF6C63FF)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)
                          ),
                          child: TextField(
                            obscureText: true,
                            cursorColor: Color(0xFF6C63FF),
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontSize: 18),
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(fontSize: 16,color: Color(0xFF6C63FF)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 25,),
                        InkWell(
                          onTap:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                          },
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:  Color(0xFF6C63FF),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )

                      ],
                    ),
                    ),

                ],

              ),
             ),
        ),
      )
    );
  }
}



