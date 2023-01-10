import 'package:firebase_auth/firebase_auth.dart';

class RegisterController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  RegisterController();

  void register({
    required String email,
    required String password,
    required String passwordRepeat,
  }) async {
    UserCredential _userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
