import 'package:family_expenses/DataBase/database_updateData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:family_expenses/Data/user.dart';

UserDetails _userFromFirebaseUser(User user) {
  return user != null ? UserDetails(uid: user.uid) : null;
}


class UserAuthentication{
  final FirebaseAuth _auth= FirebaseAuth.instance;

  Future<String> currentUser() async {
    User user =  FirebaseAuth.instance.currentUser;
    return user != null ? user.uid : null;
  }

Future registerNewUser(String firstName, String lastName, String gender, String age, String address, String phoneNumber, String email, String password,String image) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    User user=userCredential.user;
    print(user.uid);
    await UpdateUserData(uid: user.uid).addUser(firstName, lastName, gender, age, email, address, phoneNumber,image);
    return _userFromFirebaseUser(user);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }

}

Future<String> signInUser(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    User user=userCredential.user;
    return "User";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    return e.code;
  }
}


}