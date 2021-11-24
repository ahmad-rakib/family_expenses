import 'package:family_expenses/DataBase/database_updateData.dart';
import 'package:family_expenses/Pages/dailyIncome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddDailyIncome extends StatefulWidget{
  @override
  _AddDailyIncome createState() =>_AddDailyIncome();
  }

class _AddDailyIncome extends State<AddDailyIncome>{
  List _selectDate=['1' ,'2' ,'3' ,'4' ,'5' ,'6' ,'7' ,'8' ,'9' ,'10' ,'11' ,'12' ,'13' ,'14' ,'15' ,'16' ,'17' ,'18' ,'19' ,'20' ,'21' ,'22' ,'23' ,'24' ,'25' ,'26' ,'27' ,'28' ,'29' ,'30' ,'31'];

  List _selectYear=['2020' ,'2021' ,'2022' ,'2023' ,'2024' ,'2025' ,'2026' ,'2027' ,'2028' ,'2029' ,'2030' ,'2031' ,'2032' ,'2033' ,'2034' ,'2035' ,'2036' ,'2037' ,'2038' ,'2039' ,'2040' ,'2041' ,'2042' ,'2043' ,'2044' ,'2045' ,'2046' ,'2047' ,'2048' ,'2049' ,'2050'];

  List _selectMonth=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  final formKey= GlobalKey<FormState>();
  String date, error, day, month, year, userUid, id;
  String amount;


  UpdateUserData _dailyExpenses=UpdateUserData();

  User user =FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    id=randomAlpha(5)+randomAlphaNumeric(5)+randomAlpha(5)+randomAlphaNumeric(5);

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        userUid=user.uid;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final height1=MediaQuery.of(context).size.height;
    final width1=MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 233, 0.85),
      body: Form(
        key:  formKey,
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                  children:<Widget> [
                    SizedBox(
                      height :height1*0.10,
                    ),
                    Text("Store Daily Income",style: TextStyle(fontSize: 36, fontFamily: 'Teko',color: Color.fromRGBO(25, 25, 112, 1)),),
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              //color: Colors.white54,
                              margin: EdgeInsets.symmetric(horizontal: 3.5),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  labelText: 'Day',
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
                                value: day,
                                onChanged: (newValue){
                                  setState(() {
                                    day=newValue;
                                  });
                                },
                                items: _selectDate.map((valueItem){
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem, style: TextStyle(fontSize: 19,color: Color.fromRGBO(  35, 44, 155 , 1), fontFamily: 'Teko',fontWeight: FontWeight.w400),),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
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
                            flex: 1,
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
                        ],

                      ),
                    ),
                    SizedBox(
                      height :height1*0.20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        cursorColor:Color.fromRGBO(  35, 44, 155 , 1),
                        style: TextStyle(
                            color: Color.fromRGBO(  35, 44, 155 , 1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
                                borderSide:BorderSide(color: Color.fromRGBO(  35, 44, 155 , 1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
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
                            labelText: "Today's Income",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(  35, 44, 155 , 1)),
                            prefixIcon: Icon(
                              Icons.money_outlined,
                              color: Color.fromRGBO(  35, 44, 155 , 1),
                              size: 24,
                            )),
                        validator: (val) {
                          final pattern = '[0-9]+';
                          final regExp = RegExp(pattern);

                          if (val.isEmpty) {
                            return 'Amount cannot be empty';
                          } else if (!regExp.hasMatch(val)) {
                            return 'Amount can only be digit';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() => amount = val);
                        },

                      ),
                    ),
                    SizedBox(
                      height :height1*0.20,
                    ),

                    SizedBox(
                      height: 45,
                      width: 125,
                      child: RaisedButton(onPressed: () async {
                        final isValid = formKey.currentState.validate();
                        date=day+' '+month+', '+year;
                        if(isValid)
                        {
                          formKey.currentState.save();
                          dynamic result= await _dailyExpenses.addDailyIncome(amount,day, month, year,date, userUid, id);
                          if(result == null) {
                            setState(() {
                              error = 'Could not sign in with those credentials';});
                            _onErrorPop(error);
                          }
                          _onSuccessPop();
                        }
                      },
                        color:Color.fromRGBO(1, 9, 79, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        splashColor: Colors.blue.shade900,
                        highlightColor: Colors.blue,
                        highlightElevation: 30,
                        child: Text("Add Income", style: TextStyle(color: Colors.white,fontSize: 20, fontFamily: 'Teko'),),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ]

              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onSuccessPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        content: new Text('Daily income has been added!!!'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyIncome())),
            child: new Text('Ok'),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future<bool> _onErrorPop(String error) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        content: new Text(error),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDailyIncome())),
            child: new Text('Retry'),
          ),
        ],
      ),
    ) ??
        false;
  }

}

