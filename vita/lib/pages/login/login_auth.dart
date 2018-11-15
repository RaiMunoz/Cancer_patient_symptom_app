import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class loginAuthImplement{
  //Need a way to sign in
  Future<String> signIn(String email, String password);
  // Or some way to sign up!
  Future<String> signUp(String email, String password);

  // Don't forget who you are, or closing the door behind you!
  Future<String> getCurrentUser();
  Future<void> signOut();
}

class Auth implements loginAuthImplement {

  // Need to communicate with the database somehow
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Need to create Signin Async function
  Future<String> signIn(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email:email,password:password);
    return user.uid;
  }

  //Same goes for signing up!
  Future<String> signUp(String email, String password) async
  {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email:email,password:password);
    return user.uid;
  }

  // Find out who we are!
  //Same goes for signing up!
  Future<String> getCurrentUser() async
  {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null ? user.uid : null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}