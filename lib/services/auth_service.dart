import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_tut/models/app_user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();


  //Sign up a new user
  static Future<AppUser?> signUp(String email, String password) async{
    try{
      final UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user != null){
        return AppUser(
          uid: credential.user!.uid,
          email: credential.user!.email!
        );
      }
      return null;
    }catch (e){
      return null;
    }
  }

  //Sign in
  static Future<AppUser?> signIn(String email, String password) async{
    try{
      final UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if(credential.user != null){
        return AppUser(
          uid: credential.user!.uid,
          email: credential.user!.email!
        );
      }
      return null;
    }catch (e){
      return null;
    }
  }

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print('Exception during Google sign-in: $e');
      return null;
    }
  }

  // Sign out
  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut(); 
  }
}