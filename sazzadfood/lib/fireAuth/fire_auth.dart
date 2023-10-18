import 'package:firebase_auth/firebase_auth.dart';

class FireAuth{
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    }catch (e){

    }
  }
}