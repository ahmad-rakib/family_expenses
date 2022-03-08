
import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteData{
  Future deleteUser(String dbId, String userId, String year, String id) async{
    CollectionReference dbRef=FirebaseFirestore.instance.collection(dbId).doc(userId).collection(year);
    return await dbRef
        .doc(id)
        .delete()
        .then((value) => print("Data Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

}


