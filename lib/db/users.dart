import 'package:firebase_database/firebase_database.dart';

class UserServices {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";

  createUser(String uid,Map value) {
    _database.reference().child("$ref/uid").push().set(
      value
    ).catchError((e)=>{print(e.toString())});
  }
}
