import 'package:flutter/material.dart';

import 'package:family_expenses/Widget/family_member_class.dart';

class FamilyMember extends StatefulWidget {
  @override
  _FamilyMemberState createState() => _FamilyMemberState();
}

class _FamilyMemberState extends State<FamilyMember> {
  @override
  Widget build(BuildContext context) {

    final maxWidth=MediaQuery.of(context).size.width;
    final maxHeight=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFB6B6B4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(" Members", style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Teko'),),
              ),
              SizedBox(height: 10,),
              Container(
                height: 110,
                child: FamilyMemberClass(),
              ),
              Container(
                margin: EdgeInsets.only(top: 35, bottom: 20),
                height: maxHeight*.65,
                width: maxWidth*.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
