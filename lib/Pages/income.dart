import 'package:family_expenses/Pages/dailyIncome.dart';
import 'package:family_expenses/Pages/monthlyIncome.dart';
import 'package:flutter/material.dart';

class Income extends StatefulWidget{

  @override
  IncomeState createState() => IncomeState();
}

class IncomeState extends State<Income>
{
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
                SizedBox(height: height1/4.5,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MonthlyIncome()));
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
                    child: Text("Monthly Income",style: TextStyle(color: Colors.white,fontSize: 28,fontFamily: 'Teko'),textAlign: TextAlign.left,),
                  ),
                ),
                InkWell(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyIncome()));
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
                    child: Text("Daily Income",style: TextStyle(color: Colors.white,fontSize: 28,fontFamily: 'Teko'),textAlign: TextAlign.left,),
                  ),
                )
              ],

            ),
          )
      ),
    );}

}