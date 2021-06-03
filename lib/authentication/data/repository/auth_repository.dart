import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;

  Future loginWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final _userCredentials =
        await _firebaseAuth.signInWithCredential(credential);
    return _userCredentials.user;
  }

  Future logOut() async {
    await _googleSignIn.disconnect();
    await _firebaseAuth.signOut();
  }

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }
}
