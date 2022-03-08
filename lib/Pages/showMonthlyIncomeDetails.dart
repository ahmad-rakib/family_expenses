import 'package:family_expenses/Data/expensese_count.dart';
import 'package:family_expenses/DataBase/database_deleteData.dart';
import 'package:family_expenses/Pages/monthlyExpenses.dart';
import 'package:family_expenses/Pages/monthlyIncome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ShowMonthlyIncome extends StatefulWidget{
  final String userUid, id, month, year;
  final int salary, business, houseRent,carRent,bank,total;
  final List barDataList;


  ShowMonthlyIncome(
      this.userUid,
      this.id,
      this.month,
      this.year,
      this.salary,
      this.business,
      this.houseRent,
      this.carRent,
      this.bank,
      this.total,
      this.barDataList);


  @override
  _ShowMonthlyIncome createState()=>_ShowMonthlyIncome(userUid,id,month,year,salary, business, houseRent,carRent,bank,total,barDataList);

}

class _ShowMonthlyIncome  extends State<ShowMonthlyIncome> {


  final String userUid, id, month, year;
  final int salary, business, houseRent, carRent, bank,total;
  final List barDataListPro;

  double dSalary, dBusiness, dHouseRent, dCarRent, dBank, dTotal;

  List<charts.Series<Category, String>> _seriesPieData;

  List<charts.Series<LineGraph, int>> _seriesLineData;

  List<charts.Series<BarGraph, String>> _seriesBarData;

  int grocery = 0,
      shopping = 0,
      conveyance = 0,
      medical = 0,
      food = 0,
      maintenance = 0,
      extra = 0;

  double maxHeight, maxWidth;

  _ShowMonthlyIncome(this.userUid,
      this.id,
      this.month,
      this.year,
      this.salary,
      this.business,
      this.houseRent,
      this.carRent,
      this.bank,
      this.total,
      this.barDataListPro);

  DeleteData dbData= new DeleteData();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    print(barDataListPro.length);
    _seriesPieData = List<charts.Series<Category, String>>();

    _seriesLineData = List<charts.Series<LineGraph, int>>();

    _seriesBarData = List<charts.Series<BarGraph, String>>();


    generatePieData();

    //generateBarData();

    generateLineData();
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
                height: maxHeight * 2,
              ),
              Positioned(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MonthlyIncome()));
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
                    Expanded(flex:9,child: Text('Income of '+month+','+year,textAlign: TextAlign.center,style: TextStyle(fontSize: 36, color: Colors.white, fontFamily: 'Teko'),)),
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
                                          Color(0xff060552), "Salary"),
                                      _categories(
                                          Color(0xffd6364c), "Business"),
                                      _categories(
                                          Color(0xff3366cc), "House Rent"),
                                      _categories(Color(0xfffdbe19), "Car Rent"),
                                      _categories(Color(0xff109618),
                                          "Bank Interest"),
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
                                dbData.deleteUser('monthly_income', userUid, year, id),
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MonthlyIncome()))
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
                                      value('Salary',salary,Color(0xff060552),Icons.money),
                                      value('Business',business,Color(0xffd6364c),Icons.business),
                                      value('House Rent',houseRent,Color(0xff3366cc),Icons.house_outlined),
                                      value('Car Rent',carRent,Color(0xfffdbe19),Icons.car_rental),
                                      value('Bank Interest',bank,Color(0xff109618),Icons.monetization_on_outlined),
                                      value('Total',total,Color(0xffef9849),Icons.summarize_sharp),
                                      // value('Others',extra,Color(0xffdc3912),Icons.post_add_outlined),
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
                top: maxHeight * 1.1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: maxHeight * .5,
                  width: maxWidth,
                  child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Center(child: Text('Daily Income of '+ month+', '+year,style: TextStyle(fontSize: 28,fontFamily: 'Teko',color: Colors.black87),)),
                          SizedBox(height: 10,),

                          // Expanded(
                          //   child: charts.BarChart(_seriesLineData,
                          //     animate: true,
                          //     animationDuration: Duration(seconds: 2),
                          //     vertical: false,
                          //     domainAxis: new charts.OrdinalAxisSpec(
                          //         renderSpec: new charts.SmallTickRendererSpec(
                          //
                          //             labelStyle: new charts.TextStyleSpec(
                          //                 fontSize: 14,
                          //                 fontFamily: 'Teko',
                          //                 color: charts.MaterialPalette.black),
                          //
                          //             lineStyle: new charts.LineStyleSpec(
                          //                 color: charts.MaterialPalette
                          //                     .black))),
                          //     barRendererDecorator: new charts
                          //         .BarLabelDecorator<String>(
                          //       insideLabelStyleSpec: new charts.TextStyleSpec(
                          //           fontFamily: 'Teko',
                          //           fontSize: 20,
                          //           color: charts.MaterialPalette.white),
                          //       outsideLabelStyleSpec: new charts.TextStyleSpec(
                          //           fontFamily: 'Teko',
                          //           fontSize: 20,
                          //           color: charts.MaterialPalette.white),
                          //
                          //
                          //     ),
                          //
                          //     primaryMeasureAxis: new charts.NumericAxisSpec(
                          //         renderSpec: new charts.GridlineRendererSpec(
                          //
                          //             labelStyle: new charts.TextStyleSpec(
                          //                 fontSize: 12,
                          //                 color: charts.MaterialPalette.black),
                          //
                          //             lineStyle: new charts.LineStyleSpec(
                          //                 color: charts.MaterialPalette
                          //                     .black))),
                          //   ),
                          // ),
                          Expanded(
                            child: charts.LineChart(_seriesLineData,
                                animate: true,
                                animationDuration: Duration(seconds: 2),
                                defaultRenderer: new charts.LineRendererConfig(includePoints: true,))
                          )
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
    dSalary = salary != 0 ? double.parse(
        ((salary / total) * 100).toStringAsFixed(1)) : 0.0;
    dBusiness = business != 0
        ? double.parse(((business / total) * 100).toStringAsFixed(1))
        : 0.0;
    dHouseRent = houseRent != 0
        ? double.parse(((houseRent / total) * 100).toStringAsFixed(1))
        : 0.0;
    dCarRent = carRent != 0
        ? double.parse(((carRent / total) * 100).toStringAsFixed(1))
        : 0.0;
    dBank = bank != 0
        ? double.parse(((bank / total) * 100).toStringAsFixed(1))
        : 0.0;
    dTotal = dSalary + dBusiness + dHouseRent + dCarRent + dBank ;

    var pieData = [
      new Category('House Rent', dSalary, salary != 0
          ? ((salary / total) * 100).toStringAsFixed(1)
          : '0.0', Color(0xff060552)),
      new Category('business', dBusiness,
          business != 0 ? ((business / total) * 100).toStringAsFixed(1) : '0.0',
          Color(0xffd6364c)),
      new Category('houseRent', dHouseRent,
          houseRent != 0 ? ((houseRent / total) * 100).toStringAsFixed(1) : '0.0',
          Color(0xff3366cc)),
      new Category('carRent', dCarRent,
          carRent != 0 ? ((carRent / total) * 100).toStringAsFixed(1) : '0.0',
          Color(0xff990099)),
      new Category('bank', dBank,
          bank != 0 ? ((bank / total) * 100).toStringAsFixed(1) : '0.0',
          Color(0xff109618)),
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
  generateLineData() {
    var lineData=[
      new LineGraph(barDataListPro[0]['Day'], barDataListPro[0]['Amount'])
    ];

    for(int index=1;index<barDataListPro.length;index++)
    {
      lineData.add(LineGraph(barDataListPro[index]['Day'],barDataListPro[index]['Amount']));
    }
    
    _seriesLineData.add(charts.Series(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      domainFn: (LineGraph sales, _) => sales.day,
      measureFn: (LineGraph sales, _) => sales.val,
      data: lineData,
    ));



  }


  // generateBarData() {
  //   print("Second:" + '${barDataListPro.length}');
  //
  //   calculateVal();
  //
  //
  //   var barData = [
  //     new BarGraph('Grocery', grocery, Icons.local_grocery_store_outlined,
  //         Color(0xff060552)),
  //     new BarGraph(
  //         'Shopping', shopping, Icons.shopping_bag_outlined, Color(0xffd6364c)),
  //     new BarGraph('Conveyance', conveyance, Icons.directions_bus_sharp,
  //         Color(0xff3366cc)),
  //     new BarGraph('Medical', medical, Icons.medical_houseRent_outlined,
  //         Color(0xfffdbe19)),
  //     new BarGraph('Food', food, Icons.fastfood_outlined, Color(0xff109618)),
  //     new BarGraph(
  //         'Maintenance', maintenance, Icons.lightbulb_sharp, Color(0xff990099)),
  //     new BarGraph(
  //         'Others', extra, Icons.playlist_add_sharp, Color(0xffdc3912)),
  //
  //   ];
  //
  //   _seriesBarData.add(
  //     charts.Series(
  //       domainFn: (BarGraph barGraph, _) => barGraph.type.toString(),
  //       measureFn: (BarGraph barGraph, _) => barGraph.value,
  //       colorFn: (BarGraph barGraph, _) =>
  //           charts.ColorUtil.fromDartColor(barGraph.color),
  //       id: 'BarGraph',
  //       data: barData,
  //       labelAccessorFn: (BarGraph row, _) => "${row.value.toString() + ' Tk'}",
  //
  //     ),
  //   );
  // }

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


  // void calculateVal() {
  //   print("Third:" + '${barDataListPro.length}');
  //
  //   for (int index = 0; index < barDataListPro.length; index++) {
  //     grocery = grocery + barDataListPro[index]['Grocery'];
  //     shopping = shopping + barDataListPro[index]['Shopping'];
  //     conveyance = conveyance + barDataListPro[index]['Conveyance'];
  //     medical = medical + barDataListPro[index]['Medical'];
  //     food = food + barDataListPro[index]['Food'];
  //     maintenance = maintenance + barDataListPro[index]['Maintenance'];
  //     extra = extra + barDataListPro[index]['Others'];
  //   }
  //   print('Grocery:' + '$grocery');
  //   print('Shopping:' + '$shopping');
  //   print('Conveyance:' + '$conveyance');
  //   print('Medical:' + '$medical');
  //   print('Food:' + '$food');
  //   print('Maintenance:' + '$maintenance');
  //   print('Others:' + '$extra');
  // }
  //

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