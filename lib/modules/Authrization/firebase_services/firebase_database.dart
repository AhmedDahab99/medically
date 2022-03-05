import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('profileInfo');

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> createUserData(String name, String phone, String email,
      String image, String address, int age, String job, String uid) async {
    return await profileList.doc(uid).set({
      'name': name,
      'phone': phone,
      'email': email,
      'imageUrl': image,
      'address': address,
      'age': age,
      'job':job,
      'uid': uid
    });
  }

  Future updateUserList(String name, String phone, String email, String image,
      String address, int age, String job, String uid) async {
    return await profileList.doc(uid).update({
      'name': name,
      'phone': phone,
      'email': email,
      'imageUrl': image,
      'address': address,
      'age': age,
      'job':job
    });
  }

  Future getUser(String uid) async {
    try {
      var userData = await profileList.doc(uid).get();
      return userData.data;
    } catch (e) {
      return e.message;
    }
  }

  String getUserID() {
    return _firebaseAuth.currentUser.uid;
  }

  Future getUsersList() async {
    List itemsList = [];
    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
