import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../models/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  // Future<auth.User?> signInWithGoogle() async {
  //   final googleSignIn = signInWithGoogle();
  //   if (googleUser != null) {
  //     final googleAuth = await googleUser.serverAuthCode;
  //     if (googleAuth.idToken != null) {
  //       final userCredential = await _firebaseAuth
  //           .signInWithCredential(auth.GoogleAuthProvider.credential(
  //         idToken: googleAuth.idToken,
  //         accessToken: googleAuth.accessToken,
  //       ));
  //       return userCredential.user;
  //     } else {
  //       throw auth.FirebaseAuthException(
  //         code: 'missing id token',
  //         message: 'misssing google id token',
  //       );
  //     }
  //   } else {
  //     throw auth.FirebaseAuthException(
  //         code: 'Error', message: 'Sign in cancled');
  //   }
  // }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
