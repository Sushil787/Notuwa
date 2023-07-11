import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

/// App Module
@module
abstract class AppModule {
  /// Firestore auth
  @injectable
  FirebaseFirestore get store => FirebaseFirestore.instance;

  /// FirebaseAuth
  @injectable
  FirebaseAuth get auth => FirebaseAuth.instance;
  /// Google Sign in instance
  @injectable
  GoogleSignIn get googleSignin => GoogleSignIn();
}
