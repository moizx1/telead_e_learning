import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  GoogleSignIn? googleSignIn;
  FirebaseAuth? firebaseAuth;
  FirebaseFirestore firestore=FirebaseFirestore.instance;

//  Future<bool> isLoggedIn() async {
//  }

  Future register(email, password) async {
    try {
      final newUser = await firebaseAuth?.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }

   Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Sign out
   Future<void> googleSignOut() async {
    // await GoogleUser.signOut();
    await GoogleSignIn().disconnect();
  }

   Future<void> firebaseSignOut() async {
    // await GoogleUser.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
