import 'package:flutter/material.dart';

import 'package:family_expenses/Widget/family_member_class.dart';

class FamilyMember extends StatefulWidget {
  @override
  _FamilyMemberState createState() => _FamilyMemberState();
}

class _FamilyMemberState extends State<FamilyMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(" Members", style: TextStyle(
                  color: Color.fromRGBO(39, 49, 79, .7),
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Pacifico'),),
            ),
            SizedBox(height: 10,),
            Container(
              height: 110,
              child: memberContain(),
            ),
          ],
        ),
      ),

    );
  }
}
