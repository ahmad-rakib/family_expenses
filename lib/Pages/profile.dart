import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_expenses/Pages/userProfile.dart';
import 'package:family_expenses/Pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:family_expenses/Pages/expenses.dart';
import 'package:family_expenses/Widget/RecentExpense.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'income.dart';


class ProfilePage extends StatefulWidget{

  final String name, image;

  ProfilePage(this.name,this.image);

  @override
  _ProfilePageState createState()=> _ProfilePageState(name,image);
}

class _ProfilePageState  extends State<ProfilePage> with SingleTickerProviderStateMixin{
  bool isMenuOpen = true;
  String userUid, email;
  final String name, image;

  DateTime now= new DateTime.now();

  List _selectMonth=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  List _weekDay=['Mon','Tus','Wed','Thu','Fri','Sat','Sun'];

  _ProfilePageState(this.name, this.image);

  User auth=FirebaseAuth.instance.currentUser;

  Map<String, dynamic> userData;

  var temp,description, currently,windSpeed,humidity;


  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    getWeather();
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
           //name=userData['FirstName']+' '+userData['LastName'];
         }
       });
      }
    });




    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
         backgroundColor: Color.fromRGBO(193, 214, 233, 0.85),
        body: Stack(
          children: <Widget>[
            menuScreen(context),
            homeScreen(context),

          ],

        ),

      ),
    );
  }

 Widget menuScreen(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Color(0xFF348781),
          color: Colors.teal[600].withOpacity(1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 30, left:12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 0, top: 20),
                        child: Icon(
                            Icons.apps_sharp,
                          size: 36,
                          color: Colors.white60,
                        ),
                      ),
                      Align(
                            alignment: Alignment.centerLeft,
                          child: Text('Halnagad', style: TextStyle(fontSize: 36, fontFamily: 'Teko', color: Colors.white),))

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left:12.0),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile(userData['FirstName'],userData['LastName'],userData['Age'],userData['Gender'],userData['Address'],userData['Phone'],userData['Email'],userData['Image'])));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.account_circle_outlined,color: Colors.white,size: 24,),
                            SizedBox(width: 5,),
                            Text('Profile', style: TextStyle(fontSize: 20,color: Colors.white, fontFamily: 'Teko' ),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Expenses()));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.attach_money,color: Colors.white,size: 24,),
                            SizedBox(width: 5,),
                            Text('Expenses', style: TextStyle(fontSize: 20,color: Colors.white, fontFamily: 'Teko'),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Income()));
                        },

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(FlutterIcons.money_bill_faw5s,color: Colors.white,size: 18,),
                            SizedBox(width: 12),
                            Text('Income', style: TextStyle(fontSize: 20,color: Colors.white, fontFamily: 'Teko'),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[
                      //     Icon(Icons.event,color: Colors.white,size: 24,),
                      //     SizedBox(width: 5,),
                      //     Text('Budget', style: TextStyle(fontSize: 20,color: Colors.white, fontFamily: 'Teko'),),
                      //   ],
                      // ),

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left:12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[
                      //     Icon(
                      //       Icons.settings,
                      //       color: Colors.white,
                      //       size: 24,
                      //     ),
                      //     Text(
                      //       'Settings',
                      //       style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Teko'),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(width: 150,),
                      InkWell(
                        onTap:()async{
                          await FirebaseAuth.instance.signOut();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                              size: 24,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Teko'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );

 }

 Widget homeScreen(BuildContext context) {
   return AnimatedPositioned(
       duration: duration,
       top: 0,
       bottom: 0,
       left: isMenuOpen ? 0 : 0.5 * screenWidth,
       right: isMenuOpen ? 0 : -0.4 * screenWidth,
       child: ScaleTransition(
       scale: _scaleAnimation,
       child: Material(
       animationDuration: duration,
       borderRadius: BorderRadius.only(topLeft:isMenuOpen?Radius.circular(0):Radius.circular(40)),
         elevation: 8,
         color:Color.fromRGBO(193, 214, 233, 0.85),
         //color: Color.fromRGBO(247, 231, 206, 1),
         child: SingleChildScrollView(
           child: Container(
             child: Column(
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       isMenuOpen?IconButton(
                         onPressed: () {
                           setState(() {
                             _controller.forward();
                             isMenuOpen=false;
                           });
                         },
                         icon: Icon(Icons.menu,size: 26,color: Colors.white,),
                       ):IconButton(
                         onPressed: () {
                           setState(() {
                             _controller.reverse();
                             isMenuOpen=true;
                           });
                         },
                         icon: Icon(Icons.arrow_back_ios,size: 26,),
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(name,style: TextStyle(fontSize: 28,fontFamily: 'Teko',color:Colors.white)),
                           Container(
                             width:60,
                             height: 60,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               boxShadow: [
                                 BoxShadow(
                                     color: Colors.black26,
                                     blurRadius: 10.0,
                                     offset: Offset(3, 3))
                               ],
                             ),
                             child: Image(
                               image: AssetImage('assets/images/'+image),
                               fit: BoxFit.fill,
                             ),
                           ),
                         ],
                       ),

                     ],
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(left: 15,right: 15,top:0),
                   height: 220,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     boxShadow: [
                       BoxShadow(
                           color: Colors.black.withOpacity(0.5),
                           blurRadius: 10,
                           offset: Offset(5,5)
                       )

                     ],
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       Expanded(
                         flex: 3,
                         child: Container(
                           alignment: Alignment.centerLeft,
                           padding: EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                           child: Column(
                             children: <Widget>[
                               SizedBox(height: 75,),
                               Container(
                                 width: 75,
                                 padding: EdgeInsets.all(5),
                                 child: Stack(
                                   children: <Widget>[
                                     Positioned(
                                       top:-7,
                                       left: 15,
                                       child: Icon(
                                         Icons.cloud,
                                         size: 45,
                                         color: Colors.grey[400],
                                       ),
                                     ),
                                     Icon(
                                       Icons.cloud,
                                       size: 45,
                                       color: Colors.yellow[300],
                                     ),
                                     Positioned(
                                       top:-10,
                                       left: 30,
                                       child: Icon(
                                         Icons.wb_sunny,
                                         size: 40,
                                         color: Colors.yellowAccent[200],
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Icon(
                                     Icons.thermostat_auto_sharp,
                                     size: 24,
                                     color: Colors.deepOrange,
                                   ),
                                   Text(temp!=null?temp.toString()+"\u00B0"+"C":"Loading", style: TextStyle(fontSize: 24,color: Colors.black,fontFamily: 'Teko'),),
                                 ],
                               ),
                               Text(description!=null?description.toString():"Loading", style: TextStyle(fontSize: 24,color: Colors.black,fontFamily: 'Teko'),),

                             ],
                           ),
                         ),
                       ),
                       Expanded(
                         flex: 2,
                         child: Container(
                           alignment: Alignment.centerLeft,
                           child: Column(
                             children: <Widget>[
                               Align(
                                   alignment:Alignment.centerLeft,
                                   child: Text(_weekDay[now.weekday-1],style: TextStyle(fontSize: 30,color: Colors.black,fontFamily: 'Teko'))),
                               Align(
                                   alignment:Alignment.centerLeft,
                                   child: Text('${now.day}'+' '+_selectMonth[now.month-1]+','+' '+'${now.year}',style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Teko'))),
                             ],
                           ),
                         ),
                       ),
                       Expanded(
                         flex: 2,
                         child: Container(
                           child: Column(
                             children: [
                               SizedBox(height: 100,),
                               Text(currently!=null?currently.toString():"Loading", style: TextStyle(fontSize: 24,color: Colors.black,fontFamily: 'Teko'),),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text(humidity!=null?humidity.toString():"Loading", style: TextStyle(fontSize: 24,color: Colors.black,fontFamily: 'Teko'),),
                                   Icon(
                                     Icons.water,
                                     size: 24,
                                     color: Colors.green,
                                   ),

                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text(windSpeed!=null?windSpeed.toString():"Loading", style: TextStyle(fontSize: 24,color: Colors.black,fontFamily: 'Teko'),),
                                   Icon(
                                     Icons.air,
                                     size: 24,
                                     color: Colors.blue,
                                   ),
                                 ],
                               ),

                             ],
                           ),
                         ),
                       )

                     ],

                   ),
                 ),
                 SizedBox(height: 250,),
                 // Padding(
                 //   padding: const EdgeInsets.only(left:15),
                 //   child: Align(
                 //     alignment: Alignment.centerLeft,
                 //       child: Text('Recent', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500, fontFamily: 'Teko',color: Color.fromRGBO(49, 49, 79, 1),),)),
                 // ),
                 // Padding(
                 //   padding: const EdgeInsets.only(left:15),
                 //   child: Align(
                 //       alignment: Alignment.centerLeft,
                 //       child: Text('Daily expenses', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, fontFamily: 'Teko',color: Color.fromRGBO(49, 49, 79, 1),),)),
                 // ),
                 // Container(
                 //     height:200,
                 //     child: ShowDailyExpenses()),
                 // SizedBox(height:5,),
                 // Padding(
                 //   padding: const EdgeInsets.only(left:15),
                 //   child: Align(
                 //       alignment: Alignment.centerLeft,
                 //       child: Text('Monthly expenses', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, fontFamily: 'Teko',color: Color.fromRGBO(49, 49, 79, 1),),)),
                 // ),
                 // Container(
                 //     height:200,
                 //     child: MonthlyExpenses())
                 //

               ],
             ),
           ),
         ),
   ),
   ),
   );
 }

  Future getWeather() async {
    var url= Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=Sylhet&units=metric&appid=be05c237f3cc8d4e6549d42564214276");
    http.Response response= await http.get(url);
    var result =jsonDecode(response.body);
    setState(() {
      this.temp=result['main']['temp'];
      this.description=result['weather'][0]['description'];
      this.currently=result['weather'][0]['main'];
      this.humidity=result['main']['humidity'];
      this.windSpeed=result['wind']['speed'];

    });
  }

  Future<bool> _onWillPop() async {

    // This dialog will exit your app on saying yes
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }

}











