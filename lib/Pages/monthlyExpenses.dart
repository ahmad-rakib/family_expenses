import 'package:family_expenses/DataBase/database_readData.dart';
import 'package:family_expenses/Pages/addMonthlyExpenses.dart';
import 'package:family_expenses/Pages/showDailyExpensesDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MonthlyExpenses extends StatefulWidget{

  @override
  _MonthlyExpenses createState()=>_MonthlyExpenses();

}

class _MonthlyExpenses extends State<MonthlyExpenses>{

  List _selectYear=['2020' ,'2021' ,'2022' ,'2023' ,'2024' ,'2025' ,'2026' ,'2027' ,'2028' ,'2029' ,'2030' ,'2031' ,'2032' ,'2033' ,'2034' ,'2035' ,'2036' ,'2037' ,'2038' ,'2039' ,'2040' ,'2041' ,'2042' ,'2043' ,'2044' ,'2045' ,'2046' ,'2047' ,'2048' ,'2049' ,'2050'];

  List monthlyData=[];

  String error, month, year, userUid;

  User user=FirebaseAuth.instance.currentUser;

  final formKey= GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUserId();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color.fromRGBO(254, 249, 231, 1),
    floatingActionButton: __addMonthlyExpenses(),
    body: Form(
      key: formKey,
      child: SafeArea(
        child: Column(
          children: [
            Text('Monthly Expenses',textAlign: TextAlign.center,style: TextStyle(fontSize: 36, color: Color.fromRGBO(15, 15, 145, 1), fontFamily: 'Teko'),),
            Container(
              //color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 3.5),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: 'Year',
                            labelStyle: TextStyle(fontSize: 24,color: Color.fromRGBO(44,62,80,1), fontFamily: 'Teko',fontWeight: FontWeight.w400),
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:BorderSide(color: Color.fromRGBO(44,62,80,1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:BorderSide(color: Color.fromRGBO(44,62,80,1),width: 2)
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
                          value: year,
                          onChanged: (newValue){
                            setState(() {
                              year=newValue;
                            });
                          },
                          items: _selectYear.map((valueItem){
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem, style: TextStyle(fontSize: 19,color: Color.fromRGBO(44,62,80,1), fontFamily: 'Teko',fontWeight: FontWeight.w400),),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 45,
                          width: 45,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child: MaterialButton(
                            child: Icon(Icons.search_sharp,size: 30, color: Colors.white,),
                            onPressed: (){
                              //print(month +" "+ year);
                              monthlyExpensesDataList(userUid,year);
                            },
                            //color: Colors.deepOrange.shade500,
                            color: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),

                          ),
                        ))
                  ],

                ),
              ),
            ),

            Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: monthlyData.length>0?ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: monthlyData.length,
                  itemBuilder: (context , index){
                    return Card(
                      child:  ListTile(
                        onTap: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDailyDetails("userId",monthlyData[index]['Id'], month, year)));
                        },
                         title: Text(year,style: TextStyle(fontSize: 24, fontFamily: 'Teko'),),
                         subtitle: Text(monthlyData[index]['Month'],style: TextStyle(fontSize: 20, fontFamily: 'Teko'),),
                         trailing: Text('${monthlyData[index]['Total']}', style: TextStyle(fontSize: 24, fontFamily: 'Teko'),),
                      ),
                    );
                  },

                ):Center(child: Text("No expenses is available for this selected year"),)
            ),
          ],
        ),
      ),
    ),


  );
  }



  Widget __addMonthlyExpenses()=>FloatingActionButton(
    child: Icon(Icons.note_add_outlined),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(10)
    // ),
    foregroundColor: Colors.white,
    //backgroundColor: Color.fromRGBO(49, 39, 79, 1),
    backgroundColor: Color.fromRGBO(44,62,80,1),
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMonthlyExpenses()));
    },
  );

  currentUserId() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        userUid=user.uid;
        print(userUid);
      }
    });
  }

   monthlyExpensesDataList(String userUid,String year) async{
    dynamic resultant = await ReadData().readMonthlyData(userUid,year);

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        monthlyData = resultant;
      });
    }
  }
}