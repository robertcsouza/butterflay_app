import 'package:firebase_auth/firebase_auth.dart';

class MainController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  MainController();

  void login({required String email, required String password}) async {
    print(email);
    print(password);
    // UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
    //     email: email, password: password);
    // print(_userCredential);
  }
}
