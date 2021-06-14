import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<String> memberName=['Shafilullah','Nazma','Rabi','Tarana', 'Sabiha', 'Pallab','Rakib','add'];
List<String> avatarName=['assets/images/dad.png','assets/images/mom.png','assets/images/elder_brother.png','assets/images/elder_sister.png','assets/images/younger_sister.png',
                          'assets/images/younger_brother.png','assets/images/man.png','assets/images/add_user.png'];
int _selectedIndex=0;

class FamilyMemberClass extends StatefulWidget {
  @override
  _FamilyMemberClassState createState() => _FamilyMemberClassState();
}

class _FamilyMemberClassState extends State<FamilyMemberClass> {
  var selectedCard = memberName[0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.5),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: memberName.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildList(memberName[index], avatarName[index]);
          }
      ),
    );
  }


  Widget _buildList(String memberName, String avatarName) {
    return InkWell(
        onTap: () {
          selectCard(memberName);
        },
        child: Container(
          //duration: Duration(microseconds: 500),
          //curve: Curves.easeIn,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: memberName == selectedCard ? Color(0xFFFFA62F) : Colors
                .white,
            borderRadius: BorderRadius.all(Radius.circular(10)),

          ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(microseconds: 500),
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: memberName == selectedCard
                            ? Colors.white
                            : Color(0xFFF75D59)
                    ),
                  ),
                  Positioned(
                    left: 7.5,
                    top: 4,
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle
                        ),
                        child: Image.asset(avatarName)
                    ),
                  )
                ],
              ),
              SizedBox(height: 5,),
              Text(memberName, style: TextStyle(fontSize: 14,
                  color: memberName == selectedCard ? Colors.white : Colors
                      .black87),),
            ],
          ),
        )
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}

