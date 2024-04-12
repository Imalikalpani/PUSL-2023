import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  Future<void> signOut() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    // await _googleSignIn.signOut();
  }

  Future<String?> getMail() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    return currentUser?.email;
  }
}
w
