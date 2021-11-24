import 'package:family_expenses/DataBase/database_readData.dart';
import 'package:family_expenses/Pages/addDailyExpenses.dart';
import 'package:family_expenses/Pages/showDailyExpensesDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DailyExpenses extends StatefulWidget {
  @override
  _DailyExpensesState createState() => _DailyExpensesState();
}

class _DailyExpensesState extends State<DailyExpenses> {

  List _selectYear=['2020' ,'2021' ,'2022' ,'2023' ,'2024' ,'2025' ,'2026' ,'2027' ,'2028' ,'2029' ,'2030' ,'2031' ,'2032' ,'2033' ,'2034' ,'2035' ,'2036' ,'2037' ,'2038' ,'2039' ,'2040' ,'2041' ,'2042' ,'2043' ,'2044' ,'2045' ,'2046' ,'2047' ,'2048' ,'2049' ,'2050'];

  List _selectMonth=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  String error, month, year, userUid;
  
  //List<charts.Series<Category, String>> _seriesPieData;
  
  List dailyData = [];


  User user=FirebaseAuth.instance.currentUser;

  final formKey= GlobalKey<FormState>();
  



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUserId();
    //_seriesPieData = List<charts.Series<Category,String>>();
    //generateData();
  }



  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery
        .of(context)
        .size
        .width;
    final maxHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 233, 1),
      floatingActionButton: _addDailyExpenses(),
      body: Form(
        key: formKey,
        child: SafeArea(
            child: Column(
              children: [
                Text('Daily Expenses',textAlign: TextAlign.center,style: TextStyle(fontSize: 36, color: Color.fromRGBO(15, 15, 145, 1), fontFamily: 'Teko'),),
                Container(
                  //color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child:Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3.5),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Month',
                              labelStyle: TextStyle(fontSize: 24,color: Color.fromRGBO(  35, 44, 155 , 1), fontFamily: 'Teko',fontWeight: FontWeight.w400),
                              focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color.fromRGBO(  35, 44, 155 , 1),width: 2)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color.fromRGBO(  35, 44, 155 , 1),width: 2)
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
                            value: month,
                            onChanged: (newValue){
                              setState(() {
                                month=newValue;
                              });
                            },
                            items: _selectMonth.map((valueItem){
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem, style: TextStyle(fontSize: 19,color: Color.fromRGBO(  35, 44, 155 , 1), fontFamily: 'Teko',fontWeight: FontWeight.w400),),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3.5),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              labelText: 'Year',
                              labelStyle: TextStyle(fontSize: 24,color: Color.fromRGBO(  35, 44, 155 , 1), fontFamily: 'Teko',fontWeight: FontWeight.w400),
                              focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color.fromRGBO(  35, 44, 155 , 1),width: 2)
                              ),
                              enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:BorderSide(color: Color.fromRGBO(  35, 44, 155 , 1),width: 2)
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
                                child: Text(valueItem, style: TextStyle(fontSize: 19,color: Color.fromRGBO(  35, 44, 155 , 1), fontFamily: 'Teko',fontWeight: FontWeight.w400),),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle
                            ),
                            child: MaterialButton(
                              child: Icon(Icons.search_sharp,size: 30, color: Colors.white,),
                              onPressed: (){
                                //print(month +" "+ year);
                                dailyExpensesDataList(userUid,month,year);
                              },
                              color: Colors.deepOrange.shade500,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),

                      ),
                          ))
                    ],

                  ),
                ),

                Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: dailyData.length>0?ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: dailyData.length,
                        itemBuilder: (context , index){
                          return Card(
                            child:  ListTile(
                              onTap: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDailyDetails(dailyData[index]['Date'],dailyData[index]['Grocery'],dailyData[index]['Shopping'],dailyData[index]['Conveyance'],dailyData[index]['Medical'],dailyData[index]['Maintenance'],dailyData[index]['Others']),));
                              },
                              title: Text(dailyData[index]['Date'],style: TextStyle(fontSize: 24, fontFamily: 'Teko'),),
                              subtitle: Text(dailyData[index]['Month'],style: TextStyle(fontSize: 20, fontFamily: 'Teko'),),
                              trailing: Text('${dailyData[index]['Total']}', style: TextStyle(fontSize: 24, fontFamily: 'Teko'),),
                            ),
                          );
                        },

                      ):Text("No expenses is available for this selected month and year",textAlign: TextAlign.center,style: TextStyle(fontSize: 30, fontFamily: 'Teko'))
                    ),
              ],
            ),
          ),
      ),


    );
  }



  Widget _addDailyExpenses()=>FloatingActionButton(
    child: Icon(Icons.note_add_outlined),
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(10)
    // ),
    foregroundColor: Colors.white,
    backgroundColor: Color.fromRGBO(49, 39, 79, 1),
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDailyExpenses()));
    },
  );

  Widget _categories(Color color, String category) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: 150,
      padding: EdgeInsets.only(right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 17.5,
            width: 17.5,
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle
            ),
          ),
          SizedBox(width: 5,),
          Text(category,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }

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

  dailyExpensesDataList(String id, String month, String year) async {
    dynamic resultant = await ReadData().readDailyData(id,month,year);

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        dailyData = resultant;
      });
    }
  }


  // generateData() {
  //   var piedata = [
  //     new Category('House rent', 35.8,"35.8%", Color(0xff3366cc)),
  //     new Category('Expenses', 11.3, "11.3%", Color(0xff990099)),
  //     new Category('Loans', 10.8, "10.8%",Color(0xff109618)),
  //     new Category('Utilities', 19.6, "19.6%",Color(0xfffdbe19)),
  //     new Category('Other', 10.3, "10.3%",Color(0xffdc3912)),
  //   ];
  //
  //   _seriesPieData.add(
  //     charts.Series(
  //       domainFn: (Category category, _) => category.category,
  //       measureFn: (Category category, _) => category.categoryValue,
  //       colorFn: (Category category, _) =>
  //           charts.ColorUtil.fromDartColor(category.colorVal),
  //       id: 'Air Pollution',
  //       data: piedata,
  //       labelAccessorFn: (Category row, _) => '${row.value}',
  //     ),
  //   );
  // }


// Widget _extra()
  // {
  //   return Scaffold(
  //       backgroundColor: Color.fromRGBO(193, 214, 233, 1),
  //       floatingActionButton: _addDailyExpenses(),
  //       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  //       body: SafeArea(
  //         child: SingleChildScrollView(
  //           child: Container(
  //             child: Column(
  //               children: <Widget>[
  //                 Container(
  //                   //  child: YearCalendar(),
  //                   child: Calendar(),
  //                   // child: _buildTableCalendarWithBuilders(),
  //                 ),
  //                 Container(
  //                   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
  //                   //height: maxHeight*.70,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[
  //                       Container(
  //                         margin: EdgeInsets.only(bottom: 20),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: <Widget>[
  //                             Column(
  //                               children: <Widget>[
  //                                 _categories(Color(0xff3366cc), "House rent"),
  //                                 _categories(Color(0xfffdbe19), "Utilities"),
  //                                 _categories(Color(0xff109618), "Loans"),
  //                                 _categories(Color(0xff990099), "Expenses"),
  //                                 _categories(Color(0xffdc3912), "Others"),
  //                               ],
  //                             ),
  //                             Align(
  //                                 alignment: Alignment.topRight,
  //                                 child: Text("More details>>", style: TextStyle(color: Colors.blueAccent, fontSize: 20),))
  //                           ],
  //                         ),
  //                       ),
  //                       Align(
  //                         alignment: Alignment.bottomLeft,
  //                         child: Container(
  //                           margin: EdgeInsets.only(left: 10),
  //                           height: maxWidth * .75,
  //                           width: maxWidth * .75,
  //
  //                           child: Container(
  //                             child: Center(
  //                               child: Column(
  //                                 children: <Widget>[
  //                                   Expanded(
  //                                     child: charts.PieChart(
  //                                         _seriesPieData,
  //                                         animate: true,
  //                                         animationDuration: Duration(seconds: 3),
  //                                         defaultRenderer: new charts
  //                                             .ArcRendererConfig(
  //                                             arcWidth: 75,
  //                                             arcRendererDecorators: [
  //                                               new charts.ArcLabelDecorator(
  //                                                 labelPosition: charts
  //                                                     .ArcLabelPosition.inside,
  //
  //                                               )
  //                                             ])
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //
  //               ],
  //             ),
  //
  //           ),
  //         ),
  //       )
  //   );
  // }

}
