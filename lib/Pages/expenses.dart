import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_expenses/Pages/dailyExpenses.dart';
import 'package:family_expenses/Pages/monthlyExpenses.dart';
import 'package:family_expenses/Pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  @override
  ExpensesState createState() => ExpensesState();


}

class ExpensesState extends State<Expenses>{

  Map<String, dynamic> userData;

  String userUid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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

  }
  @override
  Widget build(BuildContext context) {

    final height1=MediaQuery.of(context).size.height;
    final width1=MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    InkWell(
                      onTap:(){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>MonthlyExpenses()));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(userData['FirstName']+' '+userData['LastName'], userData['Image'])));
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 40,
                        width: 35,
                        margin: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height1/4.5,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MonthlyExpenses()));
                  },
                  child: Container(
                    height: height1/8,
                    width: width1,
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [Colors.red.shade800, Colors.deepOrange.shade400],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10.0,
                          offset: Offset(0,6)
                      )]

                    ),
                    child: Text("Monthly Expense",style: TextStyle(color: Colors.white,fontSize: 28,fontFamily: 'Teko'),textAlign: TextAlign.left,),
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyExpenses()));
                  },
                  child: Container(
                    height: height1/8,
                    width: width1,
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [Colors.purple.shade500, Colors.blue.shade700],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 10.0,
                              offset: Offset(0,6)
                          )]

                    ),
                    child: Text("Daily Expense",style: TextStyle(color: Colors.white,fontSize: 28,fontFamily: 'Teko'),textAlign: TextAlign.left,),
                  ),
                )
              ],

            ),
          )
      ),
    );
  }
}