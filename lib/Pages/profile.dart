import 'package:family_expenses/Pages/family.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:family_expenses/Animation/FadeAnimation.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState()=> _ProfilePageState();
}

class _ProfilePageState  extends State<ProfilePage> with SingleTickerProviderStateMixin{
  bool isMenuOpen = true;

  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
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

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      body: Stack(
        children: <Widget>[
          menuScreen(context),
          homeScreen(context),

        ],

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
          color: Colors.blueGrey[500],
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(top: 30, left:12.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width:75,
                            height: 75,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image(
                              image: AssetImage('assets/images/male_user.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Ahmad Rakib", style: TextStyle(fontSize: 24, color: Color(0xFFE5E4E2).withOpacity(0.8)),),
                                SizedBox(height: 5,),
                                Text("ahmadrakib2017@gmail.com", style: TextStyle(fontSize: 18, color: Color(0xFFE5E4E2).withOpacity(0.8)),),

                              ],
                            ),
                          )
                        ],
                      ),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyMember()));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(FlutterIcons.ios_people_ion,color:  Color(0xFFE5E4E2).withOpacity(0.8),size: 36,),
                            SizedBox(width: 5,),
                            Text('Family', style: TextStyle(fontSize: 20,color: Color(0xFFE5E4E2).withOpacity(0.8) ),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Icon(EvilIcons.chart,color:  Color(0xFFE5E4E2).withOpacity(0.8),size: 30,),
                          SizedBox(width: 5,),
                          Text('Event', style: TextStyle(fontSize: 20,color: Color(0xFFE5E4E2).withOpacity(0.8) ),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Icon(FlutterIcons.chart_bar_faw5,color:  Color(0xFFE5E4E2).withOpacity(0.8),size: 30,),
                          SizedBox(width: 5,),
                          Text('Event', style: TextStyle(fontSize: 20,color: Color(0xFFE5E4E2).withOpacity(0.8) ),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: <Widget>[
                          Icon(Icons.event,color:  Color(0xFFE5E4E2).withOpacity(0.8),size: 30,),
                          SizedBox(width: 5,),
                          Text('Event', style: TextStyle(fontSize: 20,color: Color(0xFFE5E4E2).withOpacity(0.8) ),),
                        ],
                      ),

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
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color:  Color(0xFFE5E4E2).withOpacity(0.8),
                            size: 30,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(color: Color(0xFFE5E4E2).withOpacity(0.8), fontSize: 18,),
                          ),
                        ],
                      ),
                      SizedBox(width: 30,),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.exit_to_app,
                            color:  Color(0xFFE5E4E2).withOpacity(0.8),
                            size: 30,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(color: Color(0xFFE5E4E2).withOpacity(0.8), fontSize: 18,),
                          ),
                        ],
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
       borderRadius: BorderRadius.circular(isMenuOpen?0:40),
         elevation: 8,
         color: Colors.grey[400],
         child: Container(
           child: Column(
             children: <Widget>[
               Container(
                 margin: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     isMenuOpen?IconButton(
                       onPressed: () {
                         setState(() {
                           _controller.forward();
                           isMenuOpen=false;
                         });
                       },
                       icon: Icon(Icons.menu,size: 26,),
                     ):IconButton(
                       onPressed: () {
                         setState(() {
                           _controller.reverse();
                           isMenuOpen=true;
                         });
                       },
                       icon: Icon(Icons.arrow_back_ios,size: 26,),
                     ),
                     Container(
                       width:60,
                       height: 60,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                       ),
                       child: Image(
                         image: AssetImage('assets/images/male_user.png'),
                         fit: BoxFit.fill,
                       ),
                     ),
                   ],
                 ),
               ),
               Container(
                 margin: EdgeInsets.only(left: 15,right: 15,top:0),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                         color: Colors.black.withOpacity(0.5),
                         blurRadius: 10,
                         offset: Offset(5,5)
                     )

                   ],
                   borderRadius: BorderRadius.all(Radius.circular(15)),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Expanded(
                       flex: 2,
                       child: Container(
                         alignment: Alignment.centerLeft,
                         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                         child: Column(
                           children: <Widget>[
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
                             Text('29◦C', style: TextStyle(fontSize: 24,color: Colors.grey),)
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
                                 child: Text('Sun',style: TextStyle(fontSize: 30,color: Colors.grey))),
                             Align(
                                 alignment:Alignment.centerLeft,
                                 child: Text('June 28,2020',style: TextStyle(fontSize: 20,color: Colors.grey))),
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       flex: 1,
                       child: Container(
                         child: Icon(
                           Icons.arrow_forward_ios,
                           size: 24,
                           color: Colors.grey,
                         ),
                       ),
                     )

                   ],

                 ),
               )
             ],
           ),
         ),
   ),
   ),
   );
 }
}











