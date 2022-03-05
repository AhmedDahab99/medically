import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_database.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createNewUser(String name, String phone, String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseManager().createUserData(name, phone,email,'https://bit.ly/36hMv7s','عنوانك!', 20,'وظيفتك!', user.uid);
      print(result.user);
      // return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'كلمة المرور التي ادخلتها ضعيفة جدا';
      } else if (e.code == 'email-already-in-use') {
        return 'البريد الالكتروني الذي ادخلته موجود بالفعل';
      }
      else if (e.code == 'invalid-email') {
        return 'البريد الالكتروني الذي ادخلته غير صحيح';
      }
      else if (e.code == 'operation-not-allowed') {
        return 'غير مسموح بتسجيل الدخول';
      }else if (e.code == 'operation-not-allowed') {
        return 'غير مسموح بتسجيل الدخول';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

// sign in with email and password
  Future loginUser(String email,String password) async {
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      print(result);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'كلمة المرور التي ادخلتها ضعيفة جدا';
      } else if (e.code == 'email-already-in-use') {
        return 'البريد الالكتروني الذي ادخلته موجود بالفعل';
      }else
      if (e.code == 'wrong-password'){
        return 'كلمة المرور التي ادخلتها غير صحيحة';
      }else if (e.code == 'user-not-found'){
        return 'البريد الالكتروني الذي ادخلته غير موجود';
      }else if (e.code == 'invalid-email'){
        return 'البريد الالكتروني الذي ادخلته غير صحيح';
      }else if (e.code == 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.'){
        return 'يوجد مشكلة في الانترنت';
      }else if (e.code == 'user-disabled'){
        return 'تم غلق حسابك';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

// signout
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}