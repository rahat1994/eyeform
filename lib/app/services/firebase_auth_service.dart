import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DBRef = FirebaseDatabase.instance.reference();

  // FirebaseAuthService({FirebaseAuth firebaseAuth})
  //     : _firebaseAuth = FirebaseAuth ?? FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }

    return User(uid: user.uid, email: user.email);
  }

  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebase(user));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _firebaseAuth.signInAnonymously();
      User user = _userFromFirebase(result.user);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword({String email, String password}) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword({String email, String password}) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      print(user);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<User> currentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  void storeAccount() async {
    User _user = await this.user.first;
    DBRef.child('Users').child(_user.uid).set(_userMap(_user.email));
  }

  //================Authenticaiton=====================//
  Map _userMap(String email) {
    var uMap = HashMap();
    //  uMap["name"] = name;
    uMap["email"] = email.toLowerCase();
    uMap["member_since"] = ServerValue.timestamp;
    return uMap;
  }
}
