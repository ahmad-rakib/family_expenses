import 'package:family_expenses/DataBase/database_updateData.dart';
import 'package:family_expenses/Pages/expenses.dart';
import 'package:family_expenses/Pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyExpenses extends StatefulWidget{

  @override
  _CreateDailyExpense createState()=>_CreateDailyExpense();

}

class _CreateDailyExpense extends State<DailyExpenses>{
  String date, error;
  String conveyance, shopping , medical, grocery, maintenance,others;

  UpdateUserData _dailyExpenses=UpdateUserData();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 233, 0.85),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all( 10),
            child: Column(
              children:<Widget> [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
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
                        labelText: 'Date',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(  35, 44, 155 , 1)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(  35, 44, 155 , 1),
                          size: 24,
                        )),
                    validator: (val) => val.isEmpty ? 'Enter an amount' : null,
                    onChanged: (val) {
                      setState(() => date = val);
                    },

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
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
                        labelText: 'Grocery',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(  35, 44, 155 , 1)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(  35, 44, 155 , 1),
                          size: 24,
                        )),
                    validator: (val) => val.isEmpty ? 'Enter an amount' : null,
                    onChanged: (val) {
                      setState(() => grocery = val);
                    },

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
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
                        labelText: 'Shopping',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(  35, 44, 155 , 1)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(  35, 44, 155 , 1),
                          size: 24,
                        )),
                    validator: (val) => val.isEmpty ? 'Enter an amount' : null,
                    onChanged: (val) {
                      setState(() => shopping = val);
                    },

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
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
                        labelText: 'Conveyance',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(  35, 44, 155 , 1)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(  35, 44, 155 , 1),
                          size: 24,
                        )),
                    validator: (val) => val.isEmpty ? 'Enter an amount' : null,
                    onChanged: (val) {
                      setState(() => conveyance = val);
                    },

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
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
                        labelText: 'Medical',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(  35, 44, 155 , 1)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(  35, 44, 155 , 1),
                          size: 24,
                        )),
                    validator: (val) => val.isEmpty ? 'Enter an amount' : null,
                    onChanged: (val) {
                      setState(() => medical = val);
                    },

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
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
                        labelText: 'Maintenance',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(  35, 44, 155 , 1)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(  35, 44, 155 , 1),
                          size: 24,
                        )),
                    validator: (val) => val.isEmpty ? 'Enter an amount' : null,
                    onChanged: (val) {
                      setState(() => maintenance = val);
                    },

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
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
                        labelText: 'Others',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(  35, 44, 155 , 1)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(  35, 44, 155 , 1),
                          size: 24,
                        )),
                    validator: (val) => val.isEmpty ? 'Enter an amount' : null,
                    onChanged: (val) {
                      setState(() => others = val);
                    },

                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                RaisedButton(onPressed: () async {
                     dynamic result= await _dailyExpenses.addDailyExpense(date, conveyance, shopping, medical, grocery, maintenance, others);
                     if(result == null) {
                       setState(() {
                         error = 'Could not sign in with those credentials';});
                     }
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>FamilyExpenses()));
                },
                  child: Text("Add Expenses"),
                ),
              ]

            ),

          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Unsaved data will be lost.'),
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
    ) ??
        false;
  }
}