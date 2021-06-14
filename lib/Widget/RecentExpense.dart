import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Color> dColor=[Color(0xFF432cf5), Color(0xFFFF5733), Color(0xFF1bbd62)];
List<String> date=['3 May, 2021','4 May, 2021','5 May, 2021'];
List<String> day=['Sat', 'Sun', 'Mon'];
List<String> amount=['730', '1020', '340'];


List<Color> mColor=[Color(0xFF1585AD), Color(0xFF5d6d7e), Color(0xFF633974)];
List<String> month=['January', 'February', 'March'];
List<String> year=['2020', '2020', '2020'];
List<String> total=['56000', '70020', '48000'];



class DailyExpenses extends StatefulWidget{
  @override
  DExpenses createState()=>DExpenses();
  
}

class DExpenses extends State<DailyExpenses>{
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 7.5),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return _buildList(date[index], day[index], amount[index],index);
          }
      ),
    );
  }

  Widget _buildList(String date,String day,String amount, int index ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:15, horizontal: 15),
      padding: EdgeInsets.all(10),
      width: 250,
      decoration: BoxDecoration(
        color: dColor[index],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Text(date,style: TextStyle(fontSize: 24, fontFamily: 'Teko', fontWeight: FontWeight.w400, color: Colors.white),),
                   Text(day,style: TextStyle(fontSize: 36, fontFamily: 'Teko', fontWeight: FontWeight.w400, color:Colors.white),),

                ],
              ),
              Icon(Icons.calculate_outlined, size: 60,color: Colors.white70,)

            ],
          ),
          SizedBox(height: 2,),
          Align(
              alignment:Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.attach_money_outlined, size: 42,color:Colors.white),
                  Text(amount,style: TextStyle(fontSize: 36, fontFamily: 'Teko', fontWeight: FontWeight.w400, color:Colors.white,),),
                ],
              )),
         ],
      )
      ,
    );

  }
}


class MonthlyExpenses extends StatefulWidget{
@override
MExpenses createState()=>MExpenses();

}

class MExpenses extends State<MonthlyExpenses>{
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 7.5),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return _mbuildList(month[index], year[index], total[index],index);
          }
      ),
    );
  }

  Widget _mbuildList(String date,String day,String amount, int index ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:15, horizontal: 15),
      padding: EdgeInsets.all(10),
      width: 250,
      decoration: BoxDecoration(
        color: mColor[index],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(date,style: TextStyle(fontSize: 24, fontFamily: 'Teko', fontWeight: FontWeight.w400, color: Colors.white),),
                  Text(day,style: TextStyle(fontSize: 36, fontFamily: 'Teko', fontWeight: FontWeight.w400, color:Colors.white),),

                ],
              ),
              Icon(Icons.calendar_today_rounded, size: 60,color: Colors.white70,)

            ],
          ),
          SizedBox(height: 2,),
          Align(
              alignment:Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.attach_money_outlined, size: 42,color:Colors.white),
                  Text(amount,style: TextStyle(fontSize: 36, fontFamily: 'Teko', fontWeight: FontWeight.w400, color:Colors.white,),),
                ],
              )),
        ],
      )
      ,
    );

  }
}