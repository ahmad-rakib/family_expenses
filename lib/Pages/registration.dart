import 'package:family_expenses/DataBase/database_create.dart';
import 'package:family_expenses/Pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'profile.dart';






class Registration extends StatefulWidget{
  @override
  _RegistrationPageRoute1 createState()=> _RegistrationPageRoute1();
}

class _RegistrationPageRoute1  extends State<Registration>{

  List _selectGender=['Male','Female'];
  String email, password, error, firstName, lastName, gender, age, address, phoneNumber,correctPassword;
  final UserAuthentication _userAuthentication= UserAuthentication();



  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    width1: MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: Form(
        key: formKey,
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                color: Color.fromRGBO(193, 214, 233, 0.85),
                padding: EdgeInsets.symmetric(vertical: 20),

                child: Column(

                  children: <Widget>[
                    Stack(
                      children: <Widget>[
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
                          "Register",
                          style: TextStyle(
                              color: Color.fromRGBO(49,39, 79, 1),
                              fontSize:48,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Teko'
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  cursorColor: Color(0xFF6C63FF),
                                  style: TextStyle(
                                      color: Color(0xFF6C63FF),
                                      fontSize: 14),
                                  decoration: InputDecoration(
                                    labelText: 'First Name',
                                    labelStyle: TextStyle(fontSize: 18,color: Color(0xFF6C63FF),fontFamily: 'Teko',fontWeight: FontWeight.w400),
                                    focusedBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                                    ),
                                    enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                                    ),

                                  ),
                                  validator: (val) => val.isEmpty ? 'Enter your first name' : null,
                                  onChanged: (val) {
                                    setState(() => firstName = val);
                                  },
                                ),
                              ),
                              SizedBox(width: 7.5,),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  cursorColor: Color(0xFF6C63FF),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(
                                      color: Color(0xFF6C63FF),
                                      fontSize: 14),
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    labelStyle: TextStyle(fontSize: 18,color: Color(0xFF6C63FF), fontFamily: 'Teko',fontWeight: FontWeight.w400),
                                    focusedBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                                    ),
                                    enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                                    ),
                                  ),
                                  validator: (val) => val.isEmpty ? 'Enter your last name' : null,
                                  onChanged: (val) {
                                    setState(() => lastName = val);
                                  },
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
                                  height: 55,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Gender',
                                      labelStyle: TextStyle(fontSize: 18,color: Color(0xFF6C63FF), fontFamily: 'Teko',fontWeight: FontWeight.w400),
                                      focusedBorder:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                                      ),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                                      ),
                                    ),
                                    value: gender,
                                    onChanged: (newValue){
                                      setState(() {
                                        gender=newValue;
                                      });
                                    },
                                    items: _selectGender.map((valueItem){
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem, style: TextStyle(fontSize: 16,color: Color(0xFF6C63FF), fontFamily: 'Teko',fontWeight: FontWeight.w400),),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              SizedBox(width: 7.5,),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  cursorColor: Color(0xFF6C63FF),
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      color: Color(0xFF6C63FF),
                                      fontSize: 14),
                                  decoration: InputDecoration(
                                    labelText: 'Age',
                                    labelStyle: TextStyle(fontSize: 18,color: Color(0xFF6C63FF),fontFamily: 'Teko',fontWeight: FontWeight.w400),
                                    focusedBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                                    ),
                                    enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                                    ),
                                  ),
                                  validator: (value) {
                                    final pattern = '[0-9]+';
                                    final regExp = RegExp(pattern);

                                    if (value.isEmpty) {
                                      return 'Enter your age';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Age can only be in digit';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() => age = val);
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            cursorColor: Color(0xFF6C63FF),
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontSize: 14),
                            decoration: InputDecoration(
                              labelText: 'Address',
                              labelStyle: TextStyle(fontSize: 18,color: Color(0xFF6C63FF),fontFamily: 'Teko',fontWeight: FontWeight.w400),
                              focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                              ),
                            ),
                            validator: (val) => val.isEmpty ? 'Enter an address' : null,
                            onChanged: (val) {
                              setState(() => address = val);
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            cursorColor: Color(0xFF6C63FF),
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontSize: 14),
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(fontSize: 18,color: Color(0xFF6C63FF),fontFamily: 'Teko',fontWeight: FontWeight.w400),
                              focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                              ),
                            ),
                            validator: (value) {
                              final pattern = r'(^(?:[0]1)?[0-9]{11}$)';
                              final regExp = RegExp(pattern);

                              if (value.isEmpty) {
                                return 'Enter an phone number';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Enter a valid phone number';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (val) {
                              setState(() => phoneNumber = val);
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            cursorColor: Color(0xFF6C63FF),
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontSize: 14),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(fontSize: 18,color: Color(0xFF6C63FF),fontFamily: 'Teko',fontWeight: FontWeight.w400),
                              focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                              ),
                            ),
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
                          SizedBox(height: 20,),
                          TextFormField(
                            obscureText: true,
                            cursorColor: Color(0xFF6C63FF),
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontSize: 14),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 18,color: Color(0xFF6C63FF),fontFamily: 'Teko',fontWeight: FontWeight.w400),
                              focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                              ),
                            ),
                            validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            obscureText: true,
                            cursorColor: Color(0xFF6C63FF),
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                                color: Color(0xFF6C63FF),
                                fontSize: 14),
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: TextStyle(fontSize: 18,color: Color(0xFF6C63FF),fontFamily: 'Teko',fontWeight: FontWeight.w400),
                              focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color(0xFF6C63FF),width: 2)
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.red.shade900,width: 2)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Colors.green.shade700,width: 2)
                              ),
                            ),
                            validator: (val) => val.length<6 ? 'Enter the correct password' : null,
                            onChanged: (val) {
                              setState(() => correctPassword = val);
                            },
                          ),
                          SizedBox(height: 25,),
                          InkWell(
                            onTap:() async {
                              final isValid = formKey.currentState.validate();

                              if (isValid) {
                                formKey.currentState.save();
                                dynamic result = await _userAuthentication
                                    .registerNewUser(
                                    firstName,
                                    lastName,
                                    gender,
                                    age,
                                    address,
                                    phoneNumber,
                                    email,
                                    password,
                                    gender+'_User_Avatar.png');
                                if (result == null) {
                                  setState(() {
                                    error =
                                    'Could not sign in with those credentials';
                                  });
                                }
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => ProfilePage(firstName+ ' '+ lastName,gender+'_User_Avatar.png')));
                              }
                            },
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:  Color(0xFF6C63FF),
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),

                          SizedBox(height: 15,),
                          Text(
                            "-OR-", style: TextStyle(fontSize: 32,fontFamily: 'Teko', fontWeight: FontWeight.w400,
                              color:Colors.black),
                          ),
                          //SizedBox(height: 5,),
                          Text(
                            "Register with", style: TextStyle(fontSize: 24,fontFamily: 'Teko', fontWeight: FontWeight.w400,
                              color:Colors.black),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  //shape: BoxShape.circle,
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6.0,
                                          offset: Offset(5, 5))
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/facebook.png'),
                                    )),
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  //shape: BoxShape.circle,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6.0,
                                          offset: Offset(5, 5))
                                    ],
                                    image: DecorationImage(
                                      image:
                                      AssetImage('assets/images/google.png'),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Already have an account?',
                                  style: TextStyle(color: Color.fromRGBO(39, 49, 79, 1),
                                      fontSize: 30, fontFamily: 'Teko',fontWeight: FontWeight.w400)),
                              InkWell(
                                onTap: ()
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                },
                                child: Text(' Login',style: TextStyle(color: Colors.redAccent[700],
                                  fontFamily: 'Teko',fontSize: 30, )),
                              )
                            ],

                          ),
                          SizedBox(
                            height: 20,
                          )


                        ],
                      ),
                    ),

                  ],

                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}



class GallerySelection extends StatefulWidget{

  final String name, image;


  GallerySelection(this.name, this.image);

  @override
  _Selection createState() =>_Selection(name,image);
}

class _Selection extends State<GallerySelection>{

  final String name, image;

  _Selection(this.name, this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 233, 0.85),
      body: SafeArea(
          child: Container(
            padding:EdgeInsets.only(top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget> [
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      border: Border.all(width: 3, color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.linked_camera,
                      size:180,
                      color: Colors.white54,
                    ),

                  ),
                ),
                SizedBox(height: 15,),
                Text('Select a picture', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, fontFamily: 'Teko', color: Colors.white70),),
                InkWell(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(name,image)));
                  },
                  child: Center(
                    child: Container(
                      width: 250,
                      height: 45,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top:40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:  Color(0xFF6C63FF),
                      ),
                      child: Text(
                        "Register", style:TextStyle(fontSize: 30, fontWeight: FontWeight.w300, fontFamily: 'Teko', color: Colors.white) ,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}




