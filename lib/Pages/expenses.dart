import 'package:family_expenses/Pages/dailyExpenses.dart';
import 'package:family_expenses/Widget/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:family_expenses/Data/expensese_count.dart';


class FamilyExpenses extends StatefulWidget {
  @override
  _FamilyExpensesState createState() => _FamilyExpensesState();
}

class _FamilyExpensesState extends State<FamilyExpenses> {

  List<charts.Series<Category, String>> _seriesPieData;

  _generateData() {
    var piedata = [
      new Category('House rent', 35.8,"35.8%", Color(0xff3366cc)),
      new Category('Expenses', 11.3, "11.3%", Color(0xff990099)),
      new Category('Loans', 10.8, "10.8%",Color(0xff109618)),
      new Category('Utilities', 19.6, "19.6%",Color(0xfffdbe19)),
      new Category('Other', 10.3, "10.3%",Color(0xffdc3912)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Category category, _) => category.category,
        measureFn: (Category category, _) => category.categoryValue,
        colorFn: (Category category, _) =>
            charts.ColorUtil.fromDartColor(category.colorVal),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Category row, _) => '${row.value}',
      ),
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Category, String>>();
    _generateData();
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    //  child: YearCalendar(),
                    child: Calendar(),
                   // child: _buildTableCalendarWithBuilders(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    //height: maxHeight*.70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  _categories(Color(0xff3366cc), "House rent"),
                                  _categories(Color(0xfffdbe19), "Utilities"),
                                  _categories(Color(0xff109618), "Loans"),
                                  _categories(Color(0xff990099), "Expenses"),
                                  _categories(Color(0xffdc3912), "Others"),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Text("More details>>", style: TextStyle(color: Colors.blueAccent, fontSize: 20),))
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            height: maxWidth * .75,
                            width: maxWidth * .75,

                            child: Container(
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: charts.PieChart(
                                          _seriesPieData,
                                          animate: true,
                                          animationDuration: Duration(seconds: 3),
                                          defaultRenderer: new charts
                                              .ArcRendererConfig(
                                              arcWidth: 75,
                                              arcRendererDecorators: [
                                                new charts.ArcLabelDecorator(
                                                    labelPosition: charts
                                                        .ArcLabelPosition.inside,

                                                )
                                              ])
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),

            ),
          ),
        )
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
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyExpenses()));
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

}
