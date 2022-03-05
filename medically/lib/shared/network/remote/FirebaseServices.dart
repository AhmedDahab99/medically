import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final String name;
  final int phone;
  final String email;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirebaseServices(this.name, this.phone, this.email,);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'name': name, // John Doe
      'phone': phone, // Stokes and Sons
      'email': email, // 42
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // get User ID
  String getUserID() {
    return _firebaseAuth.currentUser.uid;
  }
}
