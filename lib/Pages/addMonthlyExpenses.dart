import 'package:family_expenses/DataBase/database_updateData.dart';
import 'package:family_expenses/Pages/monthlyExpenses.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddMonthlyExpenses extends StatefulWidget{

  @override
  _CreateMonthlyExpenses createState()=>_CreateMonthlyExpenses();

}

class _CreateMonthlyExpenses extends State<AddMonthlyExpenses>{


  List _selectYear=['2020' ,'2021' ,'2022' ,'2023' ,'2024' ,'2025' ,'2026' ,'2027' ,'2028' ,'2029' ,'2030' ,'2031' ,'2032' ,'2033' ,'2034' ,'2035' ,'2036' ,'2037' ,'2038' ,'2039' ,'2040' ,'2041' ,'2042' ,'2043' ,'2044' ,'2045' ,'2046' ,'2047' ,'2048' ,'2049' ,'2050'];

  List _selectMonth=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  final formKey= GlobalKey<FormState>();
  String date, error,  month, year, userUid, id;
  String houseRent, utility , services, loan, deposit,education, festivals, travel, others;

  int monthId;


  UpdateUserData _monthlyExpenses=UpdateUserData();

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

    // TODO: implement build
    return Scaffold(
      //backgroundColor: Color.fromRGBO(200, 217, 222, 1),
      backgroundColor: Color.fromRGBO(254, 249, 231, 1),
      body: Form(
        key:  formKey,
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                  children:<Widget> [
                    SizedBox(
                      height :15,
                    ),
                    Text("Store Monthly Expenses",style: TextStyle(fontSize: 36, fontFamily: 'Teko',color: Color.fromRGBO(25, 25, 112, 1)),),
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
                                  color:Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 3.5),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  labelText: 'Month',
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
                                value: month,

                                onChanged: (newValue){
                                  setState(() {
                                    month=newValue;
                                  });
                                },
                                items: _selectMonth.map((valueItem){
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
                              height: 60,
                              decoration: BoxDecoration(
                                  //color: Colors.white54,
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
                        ],

                      ),
                    ),
                    SizedBox(
                      height :10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        cursorColor:Color.fromRGBO(  35, 44, 155 , 1),
                        style: TextStyle(
                            color: Color.fromRGBO(44,62,80,1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            // fillColor: Colors.white,
                            fillColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
                                borderSide:BorderSide(color: Color.fromRGBO(26, 82, 100, 1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
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
                            labelText: 'House Rent',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(44,62,80,1)),
                            prefixIcon: Icon(
                              Icons.house_sharp,
                              color: Color.fromRGBO(44,62,80,1),
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
                          setState(() => houseRent = val);
                        },

                      ),
                    ),

                    SizedBox(
                      height :10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        cursorColor:Color.fromRGBO(  35, 44, 155 , 1),
                        style: TextStyle(
                            color: Color.fromRGBO(44,62,80,1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
                                borderSide:BorderSide(color: Color.fromRGBO(44,62,80,1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
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
                            labelText: 'Utility',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(44,62,80,1)),
                            prefixIcon: Icon(
                              Icons.electrical_services_sharp,
                              color: Color.fromRGBO(44,62,80,1),
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
                          setState(() => utility = val);
                        },

                      ),
                    ),

                    SizedBox(
                      height :10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        cursorColor:Color.fromRGBO(  35, 44, 155 , 1),
                        style: TextStyle(
                            color: Color.fromRGBO(44,62,80,1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
                                borderSide:BorderSide(color: Color.fromRGBO(44,62,80,1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
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
                            labelText: 'Service charge',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(44,62,80,1)),
                            prefixIcon: Icon(
                              Icons.miscellaneous_services_sharp,
                              color: Color.fromRGBO(44,62,80,1),
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
                          setState(() => services = val);
                        },

                      ),
                    ),
                    SizedBox(
                      height :10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        cursorColor:Color.fromRGBO(  35, 44, 155 , 1),
                        style: TextStyle(
                            color: Color.fromRGBO(44,62,80,1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
                                borderSide:BorderSide(color: Color.fromRGBO(44,62,80,1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
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
                            labelText: 'Loan',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(44,62,80,1)),
                            prefixIcon: Icon(
                              Icons.money,
                              color: Color.fromRGBO(44,62,80,1),
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
                          setState(() => loan = val);
                        },

                      ),
                    ),
                    SizedBox(
                      height :10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        cursorColor:Color.fromRGBO(  35, 44, 155 , 1),
                        style: TextStyle(
                            color: Color.fromRGBO(44,62,80,1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
                                borderSide:BorderSide(color: Color.fromRGBO(44,62,80,1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
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
                            labelText: 'Deposit & Insurance',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(44,62,80,1)),
                            prefixIcon: Icon(
                              Icons.attach_money_sharp,
                              color: Color.fromRGBO(44,62,80,1),
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
                          setState(() => deposit = val);
                        },

                      ),
                    ),
                    SizedBox(
                      height :10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        cursorColor:Color.fromRGBO(  35, 44, 155 , 1),
                        style: TextStyle(
                            color: Color.fromRGBO(44,62,80,1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
                                borderSide:BorderSide(color: Color.fromRGBO(44,62,80,1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
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
                            labelText: 'Education',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(44,62,80,1)),
                            prefixIcon: Icon(
                              Icons.school_sharp,
                              color: Color.fromRGBO(44,62,80,1),
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
                        },onChanged: (val) {
                        setState(() => education = val);
                      },

                      ),
                    ),

                    SizedBox(
                      height :10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        cursorColor:Color.fromRGBO(  35, 44, 155 , 1),
                        style: TextStyle(
                            color: Color.fromRGBO(44,62,80,1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
                                borderSide:BorderSide(color: Color.fromRGBO(44,62,80,1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
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
                            labelText: 'Festivals',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(44,62,80,1)),
                            prefixIcon: Icon(
                              Icons.festival_sharp,
                              color: Color.fromRGBO(44,62,80,1),
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
                          setState(() => festivals = val);
                        },

                      ),
                    ),

                    SizedBox(
                      height :10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        cursorColor:Color.fromRGBO(  35, 44, 155 , 1),
                        style: TextStyle(
                            color: Color.fromRGBO(44,62,80,1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
                                borderSide:BorderSide(color: Color.fromRGBO(44,62,80,1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
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
                            labelText: 'Travel',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(44,62,80,1)),
                            prefixIcon: Icon(
                              Icons.flight,
                              color: Color.fromRGBO(44,62,80,1),
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
                          setState(() => travel = val);
                        },

                      ),
                    ),

                    SizedBox(
                      height :10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        cursorColor:Color.fromRGBO(  35, 44, 155 , 1),
                        style: TextStyle(
                            color: Color.fromRGBO(44,62,80,1),
                            fontSize: 20),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
                                borderSide:BorderSide(color: Color.fromRGBO(44,62,80,1),width: 2)
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular( 10),
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
                            labelText: 'Others',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(44,62,80,1)),
                            prefixIcon: Icon(
                              Icons.post_add_outlined,
                              color: Color.fromRGBO(44,62,80,1),
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
                          setState(() => others = val);
                        },

                      ),
                    ),
                    SizedBox(
                      height :20,
                    ),

                    SizedBox(
                      height: 45,
                      width: 125,
                      child: RaisedButton(onPressed: () async {
                        final isValid = formKey.currentState.validate();
                        monthId=findMonthId(month);
                        if(isValid)
                        {
                          formKey.currentState.save();
                          dynamic result= await _monthlyExpenses.addMonthlyExpense(month, year, userUid, id,monthId, houseRent, utility, services, loan, deposit, education, festivals, travel, others);
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
                        child: Text("Add Expenses", style: TextStyle(color: Colors.white,fontSize: 20, fontFamily: 'Teko'),),
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
        content: new Text('Daily expense has been added!!!'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>MonthlyExpenses())),
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
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMonthlyExpenses())),
            child: new Text('Retry'),
          ),
        ],
      ),
    ) ??
        false;
  }

  int findMonthId(String month) {
    int id;
    for(int i=0; i<12; i++)
      {
        if(month==_selectMonth[i])
         {
           id=i+1;
           break;
         }
    }
    return id;
  }
}