import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateUserData{
  final String uid;
  UpdateUserData({this.uid});

  final CollectionReference userRef= FirebaseFirestore.instance.collection('users');

  final CollectionReference dailyExpensesRef= FirebaseFirestore.instance.collection('daily_expenses');

  Future<void> addUser(String firstName,String lastName,String gender,String age,String address,String phoneNumber)
  async {
      return await userRef.doc(uid).set({
        'FirstName': firstName,
        'LastName': lastName,
        'Gender': gender,
        'Age': age,
        'Address': address,
        'Phone': phoneNumber
      });
  }

  Future addDailyExpense(String date, String conveyance, String shopping , String medical,String grocery, String maintenance, String others)
  async {

    var total=int.parse(conveyance)+int.parse(shopping)+int.parse(maintenance)+int.parse(medical)+int.parse(grocery)+int.parse(others);
    assert(total is int);
    return await dailyExpensesRef.add({
      'Date':date,
      'Conveyance':conveyance,
      'Shopping':shopping,
      'Medical':medical,
      'Grocery':grocery,
      'Maintenance':maintenance,
      'Others':others,
      'Total':total,
    });

  }
}