import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<String> memberName=['Shafilullah','Nazma','Rabi','Tarana', 'Sabiha', 'Pallab','Rakib','add'];
List<String> avatarName=['assets/images/dad.png','assets/images/mom.png','assets/images/elder_brother.png','assets/images/elder_sister.png','assets/images/younger_sister.png',
                          'assets/images/younger_brother.png','assets/images/man.png','assets/images/add_user.png'];

Widget memberContain(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 7.5),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: memberName.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10)),

            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            color: Colors.blueGrey.withOpacity(0.75)
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
                          child: Image.asset(avatarName[index],)
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Text(memberName[index],style: TextStyle(fontSize: 14),),
              ],
            ),
          );
        }
    ),
  );



}
