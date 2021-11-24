import 'package:family_expenses/Pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserProfile extends StatefulWidget{
   final String firstName, lastName,  age,  gender,  address,  phone,  email, image;

  @override
  _UserProfile createState() => _UserProfile(firstName, lastName,  age,  gender,  address,  phone,  email, image);

  UserProfile(this.firstName, this.lastName, this.age, this.gender,
      this.address, this.phone, this.email, this.image);
}

class _UserProfile extends State<UserProfile>{

  final String firstName, lastName,  age,  gender,  address,  phone,  email, image;


  _UserProfile(this.firstName, this.lastName, this.age, this.gender,
      this.address, this.phone, this.email, this.image);

  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      //backgroundColor: Color.fromRGBO(193, 214, 233, 0.75),
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children:<Widget> [
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                height: screenHeight*0.50,
                //color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top:1,
                        left: 10,
                        child:InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(firstName+' '+lastName,image)));
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.arrow_back_ios,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                        bottom: 20,
                        right: 0,
                        left: 0,
                        child: Container(
                          height: screenHeight*.35,
                          width:screenWidth,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Align(
                              //alignment: Alignment.topCenter,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 50,),
                                    Text(firstName+' '+lastName,style: TextStyle(fontSize: 36,color: Colors.black,fontFamily: 'Teko'),),
                                    //SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                      height: 100,
                                      //width: screenWidth*.95,

                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.white
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      margin: EdgeInsets.symmetric(vertical: 7.5,horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Age",style: TextStyle(fontSize: 24,color: Colors.black,fontFamily: 'Teko'),),
                                          SizedBox(height: 2,),
                                          Text(age,style: TextStyle(fontSize: 36,color: Colors.black,fontFamily: 'Teko'),),
                                        ],
                                      ),

                                    ),
                                        Container(
                                          height: 100,
                                          //width: screenWidth*.95,

                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.white
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          margin: EdgeInsets.symmetric(vertical: 7.5,horizontal: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Gender",style: TextStyle(fontSize: 24,color: Colors.black,fontFamily: 'Teko'),),
                                              SizedBox(height: 2,),
                                              Text(gender,style: TextStyle(fontSize: 36,color: Colors.black,fontFamily: 'Teko'),),
                                            ],
                                          ),

                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                        )
                    ),
                    ),

                    Positioned(
                        left: screenWidth*0.30,
                        right: screenWidth*0.30,
                        top: 20,
                        bottom: 210,
                        child:Container(
                          width:200,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 7.5))
                            ],
                          ),
                          child: Image(
                            image: AssetImage('assets/images/'+image),
                            //fit: BoxFit.fill,
                          ),
                        ),
                    )

                  ],
                ),
              ),
              showInfo("Email", email),
              showInfo("Phone Number", phone),
              showInfo("Address", address),

            ],
          ),
        ),
      ),
    );

  }

  Widget showInfo(String type, String val){
    return Container(
      height: 70,
      width: screenWidth*.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 7.5,horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(type,style: TextStyle(fontSize: 16,color: Colors.blueGrey,fontFamily: 'Teko'),),
          SizedBox(height: 2,),
          Text(val,style: TextStyle(fontSize: 26,color: Colors.black,fontFamily: 'Teko'),),
        ],
      ),

    );
  }
}