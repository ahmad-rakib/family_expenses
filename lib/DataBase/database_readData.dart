import 'package:cloud_firestore/cloud_firestore.dart';

class ReadData{

  final CollectionReference dailyDataRef= FirebaseFirestore.instance.collection('daily_expenses');


  final CollectionReference monthlyDataRef= FirebaseFirestore.instance.collection('monthly_expenses');

  final CollectionReference userDataRef=FirebaseFirestore.instance.collection('users');



  Future readDailyData(String id, String month, String year)
  async{
    List itemsList = [];

    try {
      await dailyDataRef.doc(id).collection(year).where('Month',isEqualTo: month).orderBy('Day', descending: true).get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



  Future readMonthlyData(String id, String year)
  async{
    List itemsList = [];

    try {
      await monthlyDataRef.doc(id).collection(year).orderBy('MonthId').get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}