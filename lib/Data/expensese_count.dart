import 'package:flutter/material.dart';
class Category {
  String category;
  double categoryValue;
  String value;
  Color colorVal;

  Category(this.category, this.categoryValue,this.value, this.colorVal);
}

class BarGraph{
  String type;
  int value;
  IconData icon;
  Color color;

  BarGraph(this.type, this.value, this.icon, this.color);
}

class LineGraph{
  int day;
  int val;

  LineGraph(this.day, this.val);
}
