import 'package:family_expenses/DataBase/database_deleteData.dart';
import 'package:family_expenses/Pages/dailyExpenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:family_expenses/Data/expensese_count.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class ShowDailyDetails extends StatefulWidget{
  final String userId, id, date,month, year;
  final int day,grocery,shopping,conveyance,medical,food,maintenance, others,total;

  ShowDailyDetails(
      this.userId,
      this.id,
      this.date,
      this.day,
      this.month,
      this.year,
      this.grocery,
      this.shopping,
      this.conveyance,
      this.medical,
      this.food,
      this.maintenance,
      this.others,
      this.total);

  @override
  ShowDailyDetailsState createState() => ShowDailyDetailsState(userId,id,date,day,month,year,grocery,shopping,conveyance,medical,food,maintenance, others,total);

}

class ShowDailyDetailsState extends State<ShowDailyDetails>{

  final String userId, id, date,month, year;
  final int day,grocery,shopping,conveyance,medical,food,maintenance, others,total;

  ShowDailyDetailsState(
      this.userId,
      this.id,
      this.date,
      this.day,
      this.month,
      this.year,
      this.grocery,
      this.shopping,
      this.conveyance,
      this.medical,
      this.food,
      this.maintenance,
      this.others,
      this.total);

  List<charts.Series<Category, String>> _seriesPieData;



  double maxHeight,maxWidth;

  double dGrocery,dShopping,dConveyance,dMedical, dFood, dMaintenance, dOthers,dTotal;
  
  DeleteData dbData =new DeleteData();

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _seriesPieData = List<charts.Series<Category,String>>();



    generatePieData();

  }

  @override
  Widget build(BuildContext context) {

    maxWidth=MediaQuery.of(context).size.width;
    maxHeight=MediaQuery.of(context).size.height;

    return Scaffold(
        //backgroundColor: Color.fromRGBO(193, 214, 233, 1),
        backgroundColor: Colors.blueGrey,
        //floatingActionButton: _addDailyExpenses(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SafeArea(
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyExpenses()));
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

                Positioned(
                    child: Align(
                      alignment: Alignment.topCenter,
                        child: Text('Expenses of '+ date, style: TextStyle(fontSize: 36,fontFamily: 'Teko',color: Colors.white),))),
                Positioned(
                  top: 10,
                  left: 0,
                  child: Container(
                    //color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    height: maxHeight*.60,
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
                                                    animationDuration: Duration(seconds: 3),
                                                    defaultRenderer: new charts
                                                        .ArcRendererConfig(
                                                        arcWidth: 50,
                                                        arcRendererDecorators: [
                                                          new charts.ArcLabelDecorator(
                                                            labelPosition: charts
                                                                .ArcLabelPosition.inside,

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
                                    margin: EdgeInsets.only(left:8),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 0,),
                                        _categories(Color(0xff060552), "Grocery"),
                                        _categories(Color(0xffd6364c), "Shopping"),
                                        _categories(Color(0xff3366cc), "Conveyance"),
                                        _categories(Color(0xfffdbe19), "Medical"),
                                        _categories(Color(0xff109618), "Food"),
                                        _categories(Color(0xff990099), "Maintenance"),
                                        _categories(Color(0xffdc3912), "Others"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: maxWidth*.60,),
                            InkWell(
                              onTap: ()=>{
                                dbData.deleteUser('daily_expenses', userId, year, id),
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>DailyExpenses())),

                              },
                                child: crud(Colors.red.shade600,Icons.delete_forever_sharp)
                            ),
                            SizedBox(width: 10,),
                            //crud(Colors.green.shade600,Icons.edit),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top:maxHeight*.55,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(45),topRight: Radius.circular(45)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        Text(date, style: TextStyle(color:  Color.fromRGBO(49, 10, 79, 1),fontSize:30,fontFamily: 'Teko'),),
                        SizedBox(height: 10,),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            height: maxHeight*.5,
                            width: maxWidth,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  value('Grocery',grocery,Color(0xff060552),Icons.local_grocery_store_outlined),
                                  value('Shopping',shopping,Color(0xffd6364c),Icons.shopping_bag_outlined),
                                  value('Conveyance',conveyance,Color(0xff3366cc),Icons.directions_bus_sharp),
                                  value('Medical',medical,Color(0xfffdbe19),Icons.medical_services_outlined),
                                  value('Food',food,Color(0xff109618),Icons.fastfood_outlined),
                                  value('Maintenance',maintenance,Color(0xff990099),Icons.lightbulb_sharp),
                                  value('Others',others,Color(0xffdc3912),Icons.playlist_add_sharp),
                                  value('Total',total,Color(0xffef9849),Icons.summarize_sharp),
                                  SizedBox(height: maxHeight*.25,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        );

    }

  Widget _categories(Color color, String category) {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 5),
      width: maxWidth*.3,
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
          Text(category,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white,fontFamily: 'Teko'),),
        ],
      ),
    );
  }

  generatePieData() {

    dGrocery=grocery!=0?double.parse(((grocery/total)*100).toStringAsFixed(1)):0.0;
    dShopping=shopping!=0?double.parse(((shopping/total)*100).toStringAsFixed(1)):0.0;
    dConveyance=conveyance!=0?double.parse(((conveyance/total)*100).toStringAsFixed(1)):0.0;
    dMedical=medical!=0?double.parse(((medical/total)*100).toStringAsFixed(1)):0.0;
    dFood=food!=0?double.parse(((food/total)*100).toStringAsFixed(1)):0.0;
    dMaintenance=maintenance!=0?double.parse(((maintenance/total)*100).toStringAsFixed(1)):0.0;
    dOthers=others!=0?double.parse(((others/total)*100).toStringAsFixed(1)):0.0;
    dTotal=dGrocery+dShopping+dConveyance+dMedical+dFood+dMaintenance;



    var pieData = [
      new Category('Grocery',dGrocery,grocery!=0?((grocery/total)*100).toStringAsFixed(1):'0.0', Color(0xff060552)),
      new Category('Shopping', dShopping,shopping!=0?((shopping/total)*100).toStringAsFixed(1):'0.0', Color(0xffd6364c)),
      new Category('Conveyance',dConveyance,conveyance!=0?((conveyance/total)*100).toStringAsFixed(1):'0.0', Color(0xff3366cc)),
      new Category('Medical', dMedical,medical!=0?((medical/total)*100).toStringAsFixed(1):'0.0', Color(0xff990099)),
      new Category('Food', dFood,food!=0?((food/total)*100).toStringAsFixed(1):'0.0',Color(0xff109618)),
      new Category('Maintenance',dMaintenance,maintenance!=0?((maintenance/total)*100).toStringAsFixed(1):'0.0',Color(0xfffdbe19)),
      new Category('Others', dOthers,others!=0?((others/total)*100).toStringAsFixed(1):'0.0',Color(0xffdc3912)),
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


  Widget crud(Color color, IconData icon)
  {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:color,
      ),
      child:Icon(icon,color: Colors.white,size: 28,),
    );
  }

  Widget value(String catagory,int val,Color color, IconData icon)
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
              child: Text(catagory,style:TextStyle(fontSize: 20,fontFamily: 'Teko'),)),
          Expanded(
              flex: 5,
              child: Align(
                  alignment:Alignment.centerRight,
                  child: Text('$val',style:TextStyle(fontSize: 20,fontFamily: 'Teko'),))),

        ],
      ),
    );
  }


  Future<bool> _onSuccessPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        content: new Text('Daily expense has been deleted!!!'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyExpenses())),
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
            onPressed: () => Navigator.pop(context, MaterialPageRoute(builder: (context)=>DailyExpenses())),
            child: new Text('Retry'),
          ),
        ],
      ),
    ) ??
        false;
  }

}