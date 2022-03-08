import 'package:family_expenses/Data/expensese_count.dart';
import 'package:family_expenses/DataBase/database_deleteData.dart';
import 'package:family_expenses/Pages/monthlyExpenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ShowMonthlyExpenses extends StatefulWidget{
  final String userUid, id, month, year;
  final int houseRent, utility, services,loan,deposit,education,festivals,travel,others, total;
  final List barDataList;


  ShowMonthlyExpenses(
      this.userUid,
      this.id,
      this.month,
      this.year,
      this.houseRent,
      this.utility,
      this.services,
      this.loan,
      this.deposit,
      this.education,
      this.festivals,
      this.travel,
      this.others,
      this.total,
      this.barDataList);

  @override
  _ShowMonthlyExpenses createState()=>_ShowMonthlyExpenses(userUid,id,month,year,houseRent, utility, services,loan,deposit,education,festivals,travel,others,total,barDataList);

}

class _ShowMonthlyExpenses  extends State<ShowMonthlyExpenses> {


  final String userUid, id, month, year;
  final int houseRent, utility, services, loan, deposit, education, festivals,
      travel, others, total;
  final List barDataListPro;

  double dHouseRent, dUtility, dServices, dLoan, dDeposit, dEducation,
      dFestivals, dTravel, dOthers, dTotal;

  List<charts.Series<Category, String>> _seriesPieData;

  List<charts.Series<BarGraph, String>> _seriesBarData;

  int grocery = 0,
      shopping = 0,
      conveyance = 0,
      medical = 0,
      food = 0,
      maintenance = 0,
      extra = 0;

  double maxHeight, maxWidth;

  _ShowMonthlyExpenses(this.userUid,
      this.id,
      this.month,
      this.year,
      this.houseRent,
      this.utility,
      this.services,
      this.loan,
      this.deposit,
      this.education,
      this.festivals,
      this.travel,
      this.others,
      this.total,
      this.barDataListPro);

  DeleteData dbData= new DeleteData();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    print(barDataListPro.length);
    _seriesPieData = List<charts.Series<Category, String>>();

    _seriesBarData = List<charts.Series<BarGraph, String>>();

    generatePieData();

    generateBarData();
  }


  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery
        .of(context)
        .size
        .height;
    maxWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: maxHeight * 2.5,
              ),
              Positioned(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MonthlyExpenses()));
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(userData['FirstName']+' '+userData['LastName'], userData['Image'])));
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          height: 40,
                          width: 35,
                          margin: EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex:9,child: Text('Expenses of '+month+','+year,textAlign: TextAlign.center,style: TextStyle(fontSize: 36, color: Colors.white, fontFamily: 'Teko'),)),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 30,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  height: maxHeight * 1.1,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 0),
                                    height: maxWidth * .625,
                                    width: maxWidth * .625,
                                    child: Container(
                                      child: Center(
                                        child: Column(
                                          children: <Widget>[
                                            Expanded(
                                              child: charts.PieChart(
                                                  _seriesPieData,
                                                  animate: true,
                                                  animationDuration: Duration(
                                                      seconds: 3),
                                                  defaultRenderer: new charts
                                                      .ArcRendererConfig(
                                                    arcWidth: 50,
                                                    arcRendererDecorators: [
                                                      new charts
                                                          .ArcLabelDecorator(
                                                        labelPosition: charts
                                                            .ArcLabelPosition
                                                            .inside,

                                                      )
                                                    ],
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 0,),
                                      _categories(
                                          Color(0xff060552), "House Rent"),
                                      _categories(
                                          Color(0xffd6364c), "Utilities"),
                                      _categories(
                                          Color(0xff3366cc), "Service Charge"),
                                      _categories(Color(0xfffdbe19), "Loan"),
                                      _categories(Color(0xff109618),
                                          "Deposit & Insurance"),
                                      _categories(
                                          Color(0xff990099), "Eduction"),
                                      _categories(
                                          Color(0xff728C00), "Festivals"),
                                      _categories(Color(0xff660000), "Travels"),
                                      _categories(Color(0xffdc3912), "Others"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: maxWidth * .60,),
                          InkWell(
                            onTap: () =>{
                              dbData.deleteUser('monthly_expenses', userUid, year, id),
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MonthlyExpenses()))
                            },
                              child: crud(Colors.red.shade600, Icons.delete_forever_sharp)
                          ),
                          SizedBox(width: 10,),
                          //crud(Colors.green.shade600, Icons.edit),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                        height: maxHeight*.45,
                        width: maxWidth*.95,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child:  Column(
                          children: [
                            SizedBox(height: 15,),
                            Text(month+ ' '+ year, style: TextStyle(color:  Color.fromRGBO(49, 10, 79, 1),fontSize:30,fontFamily: 'Teko'),),
                            SizedBox(height: 10,),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Container(
                                height: maxHeight*.3,
                                width: maxWidth*.95,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      value('House Rent',houseRent,Color(0xff060552),Icons.house_outlined),
                                      value('Utility',utility,Color(0xffd6364c),Icons.electrical_services_sharp),
                                      value('Service Charge',services,Color(0xff3366cc),Icons.miscellaneous_services_sharp),
                                      value('Loan',loan,Color(0xfffdbe19),Icons.money),
                                      value('Deposit & Insurance',deposit,Color(0xff109618),Icons.attach_money_sharp),
                                      value('Education',education,Color(0xff990099),Icons.school_sharp),
                                      value('Festivals',festivals,Color(0xff728C00),Icons.festival_sharp),
                                      value('Travels',travel,Color(0xff660000),Icons.flight),
                                      value('Others',extra,Color(0xffdc3912),Icons.post_add_outlined),
                                      value('Total',total,Color(0xffef9849),Icons.summarize_sharp),
                                      SizedBox(height: 20,)
                                    ],
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
              Positioned(
                top: maxHeight * 1.2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: maxHeight * .65,
                  width: maxWidth,
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Center(child: Text('Daily Expenses of '+ month+', '+year,style: TextStyle(fontSize: 28,fontFamily: 'Teko',color: Colors.black87),)),
                          SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _categories(Color(0xff060552), "Grocery"),
                                  _categories(Color(0xffd6364c), "Shopping"),
                                  _categories(Color(0xff3366cc), "Conveyance"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _categories(Color(0xfffdbe19), "Medical"),
                                  _categories(Color(0xff109618), "Food"),
                                  _categories(Color(0xff990099), "Maintenance"),

                                ],
                              ),
                              _categories(Color(0xffdc3912), "Others"),

                            ],

                          ),
                          Expanded(
                            child: charts.BarChart(_seriesBarData,
                              animate: true,
                              animationDuration: Duration(seconds: 2),
                              vertical: false,
                              domainAxis: new charts.OrdinalAxisSpec(
                                  renderSpec: new charts.SmallTickRendererSpec(

                                      labelStyle: new charts.TextStyleSpec(
                                          fontSize: 14,
                                          fontFamily: 'Teko',
                                          color: charts.MaterialPalette.black),

                                      lineStyle: new charts.LineStyleSpec(
                                          color: charts.MaterialPalette
                                              .black))),
                              barRendererDecorator: new charts
                                  .BarLabelDecorator<String>(
                                insideLabelStyleSpec: new charts.TextStyleSpec(
                                    fontFamily: 'Teko',
                                    fontSize: 20,
                                    color: charts.MaterialPalette.white),
                                outsideLabelStyleSpec: new charts.TextStyleSpec(
                                    fontFamily: 'Teko',
                                    fontSize: 20,
                                    color: charts.MaterialPalette.white),


                              ),

                              primaryMeasureAxis: new charts.NumericAxisSpec(
                                  renderSpec: new charts.GridlineRendererSpec(

                                      labelStyle: new charts.TextStyleSpec(
                                          fontSize: 12,
                                          color: charts.MaterialPalette.black),

                                      lineStyle: new charts.LineStyleSpec(
                                          color: charts.MaterialPalette
                                              .black))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _categories(Color color, String category) {
    return Container(
      width: maxWidth * .3,
      padding: EdgeInsets.only(right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle
            ),
          ),
          SizedBox(width: 5,),
          Expanded(
            child: Text(category,
              style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: 'Teko',), textAlign: TextAlign.start,),
          ),
        ],
      ),
    );
  }


  generatePieData() {
    dHouseRent = houseRent != 0 ? double.parse(
        ((houseRent / total) * 100).toStringAsFixed(1)) : 0.0;
    dUtility = utility != 0
        ? double.parse(((utility / total) * 100).toStringAsFixed(1))
        : 0.0;
    dServices = services != 0
        ? double.parse(((services / total) * 100).toStringAsFixed(1))
        : 0.0;
    dLoan =
    loan != 0 ? double.parse(((loan / total) * 100).toStringAsFixed(1)) : 0.0;
    dDeposit = deposit != 0
        ? double.parse(((deposit / total) * 100).toStringAsFixed(1))
        : 0.0;
    dEducation = education != 0 ? double.parse(
        ((education / total) * 100).toStringAsFixed(1)) : 0.0;
    dFestivals = festivals != 0 ? double.parse(
        ((festivals / total) * 100).toStringAsFixed(1)) : 0.0;
    dTravel = travel != 0
        ? double.parse(((travel / total) * 100).toStringAsFixed(1))
        : 0.0;
    dOthers = others != 0
        ? double.parse(((others / total) * 100).toStringAsFixed(1))
        : 0.0;
    dTotal = dHouseRent + dUtility + dServices + dLoan + dDeposit + dEducation +
        dFestivals + dTravel;


    var pieData = [
      new Category('House Rent', dHouseRent, houseRent != 0
          ? ((houseRent / total) * 100).toStringAsFixed(1)
          : '0.0', Color(0xff060552)),
      new Category('Utility', dUtility,
          utility != 0 ? ((utility / total) * 100).toStringAsFixed(1) : '0.0',
          Color(0xffd6364c)),
      new Category('Services', dServices,
          services != 0 ? ((services / total) * 100).toStringAsFixed(1) : '0.0',
          Color(0xff3366cc)),
      new Category('Loan', dLoan,
          loan != 0 ? ((loan / total) * 100).toStringAsFixed(1) : '0.0',
          Color(0xff990099)),
      new Category('Deposit', dDeposit,
          deposit != 0 ? ((deposit / total) * 100).toStringAsFixed(1) : '0.0',
          Color(0xff109618)),
      new Category('Education', dEducation, education != 0
          ? ((education / total) * 100).toStringAsFixed(1)
          : '0.0', Color(0xfffdbe19)),
      new Category('Festivals', dFestivals, festivals != 0
          ? ((festivals / total) * 100).toStringAsFixed(1)
          : '0.0', Color(0xff728C00)),
      new Category('Travel', dTravel,
          travel != 0 ? ((travel / total) * 100).toStringAsFixed(1) : '0.0',
          Color(0xff660000)),
      new Category('Others', dOthers,
          others != 0 ? ((others / total) * 100).toStringAsFixed(1) : '0.0',
          Color(0xffdc3912)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Category category, _) => category.category,
        measureFn: (Category category, _) => category.categoryValue,
        colorFn: (Category category, _) =>
            charts.ColorUtil.fromDartColor(category.colorVal),
        id: 'Air Pollution',
        data: pieData,
        labelAccessorFn: (Category row, _) => '${row.value}',
      ),
    );
  }

  generateBarData() {
    print("Second:" + '${barDataListPro.length}');

    calculateVal();


    var barData = [
      new BarGraph('Grocery', grocery, Icons.local_grocery_store_outlined,
          Color(0xff060552)),
      new BarGraph(
          'Shopping', shopping, Icons.shopping_bag_outlined, Color(0xffd6364c)),
      new BarGraph('Conveyance', conveyance, Icons.directions_bus_sharp,
          Color(0xff3366cc)),
      new BarGraph('Medical', medical, Icons.medical_services_outlined,
          Color(0xfffdbe19)),
      new BarGraph('Food', food, Icons.fastfood_outlined, Color(0xff109618)),
      new BarGraph(
          'Maintenance', maintenance, Icons.lightbulb_sharp, Color(0xff990099)),
      new BarGraph(
          'Others', extra, Icons.playlist_add_sharp, Color(0xffdc3912)),

    ];

    _seriesBarData.add(
      charts.Series(
        domainFn: (BarGraph barGraph, _) => barGraph.type.toString(),
        measureFn: (BarGraph barGraph, _) => barGraph.value,
        colorFn: (BarGraph barGraph, _) =>
            charts.ColorUtil.fromDartColor(barGraph.color),
        id: 'BarGraph',
        data: barData,
        labelAccessorFn: (BarGraph row, _) => "${row.value.toString() + ' Tk'}",

      ),
    );
  }


  Widget crud(Color color, IconData icon) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Icon(icon, color: Colors.white, size: 28,),
    );
  }


  void calculateVal() {
    print("Third:" + '${barDataListPro.length}');

    for (int index = 0; index < barDataListPro.length; index++) {
      grocery = grocery + barDataListPro[index]['Grocery'];
      shopping = shopping + barDataListPro[index]['Shopping'];
      conveyance = conveyance + barDataListPro[index]['Conveyance'];
      medical = medical + barDataListPro[index]['Medical'];
      food = food + barDataListPro[index]['Food'];
      maintenance = maintenance + barDataListPro[index]['Maintenance'];
      extra = extra + barDataListPro[index]['Others'];
    }
    print('Grocery:' + '$grocery');
    print('Shopping:' + '$shopping');
    print('Conveyance:' + '$conveyance');
    print('Medical:' + '$medical');
    print('Food:' + '$food');
    print('Maintenance:' + '$maintenance');
    print('Others:' + '$extra');
  }


  Widget value(String category,int val,Color color, IconData icon)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      decoration: BoxDecoration(

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:color,
            ),
            child:Icon(icon,color: Colors.white,size: 20,),
          ),
          SizedBox(width: 5,),
          Expanded(
              flex: 3,
              child: Text(category,style:TextStyle(fontSize: 20,fontFamily: 'Teko'),)),
          Expanded(
              flex: 5,
              child: Align(
                  alignment:Alignment.centerRight,
                  child: Text('$val',style:TextStyle(fontSize: 20,fontFamily: 'Teko'),))),

        ],
      ),
    );
  }





}