import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:family_expenses/Data/expensese_count.dart';
import 'package:charts_flutter/flutter.dart';


class ShowDailyDetails extends StatefulWidget{
  @override
  ShowDailyDetailsState createState() => ShowDailyDetailsState();

}

class ShowDailyDetailsState extends State<ShowDailyDetails>{



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView()
      ),
    );
    }
}