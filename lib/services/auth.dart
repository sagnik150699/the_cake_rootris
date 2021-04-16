import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_cake_rootris/services/database.dart';

class Authentication extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var uid;
  String _error;
  String get error => _error;

  String _search;
  String get search => _search;

  set search(String val) {
    notifyListeners();
  }

  searchData(String v) {
    _search = v;
    notifyListeners();
  }

  set error(String val) {
    notifyListeners();
  }

  emailLogin(var email, var password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      uid = _auth.currentUser.uid;
      return true;
    } catch (e) {
      error = e.toString();
      print(error);
      notifyListeners();
      return false;
    }
  }

  emailRegister(var email, var password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      uid = _auth.currentUser.uid;
      return true;
    } catch (e) {
      //   print(e);
      error = e;
      notifyListeners();

      return false;
    }
  }

  setName(String name) async {
    try {
      await _auth.currentUser.updateProfile(displayName: name);
    } catch (e) {
      print("The error while adding name $e");
    }
  }

  Future<String> requestName() async {
    try {
      return _auth.currentUser.displayName;
    } catch (e) {
      return (e);
    }
  }

  Database _database = new Database();
  isSigned() async {
    try {
      //await _database.test();
      uid = _auth.currentUser.uid;
      return true;
    } catch (e) {
      print("Is not Signed in $e");
      return false;
    }
  }

  googleSigning() async {
    final userGoogle = await _googleSignIn.signIn();

    if (userGoogle != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await userGoogle.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      uid = authResult.user.uid;
      print("Google Signing In");
      return true;
    } else
      return false;
  }
}
