import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  static bool _initialized = false;

  /// Initialize Firebase
  static Future<void> initialize() async {
    if (_initialized) return;
    
    // Only initialize on supported platforms
    if (kIsWeb) {
      // For web, use default Firebase config
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDRHItRZumZM2dQWIKdHxbCTREdPbMNQzE",
          authDomain: "habits-app-915f2.firebaseapp.com",
          projectId: "habits-app-915f2",
          storageBucket: "habits-app-915f2.firebasestorage.app",
          messagingSenderId: "66957835605",
          appId: "1:66957835605:android:1e10ef9228c6bdda6403dc"
        )
      );
    } else {
      await Firebase.initializeApp();
      // Enable offline persistence for Firestore
      FirebaseFirestore.instance.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
      );
    }
    _initialized = true;
  }

  /// Get current user
  static User? get currentUser => FirebaseAuth.instance.currentUser;

  /// Sign in anonymously (for now)
  static Future<User> signInAnonymously() async {
    final credential = await FirebaseAuth.instance.signInAnonymously();
    return credential.user!;
  }

  /// Sign in with Google
  static Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    
    // Trigger the Google Sign-In flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    
    if (googleUser == null) return null; // User cancelled
    
    // Get the auth details
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    
    // Create credentials
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
    // Sign in to Firebase
    final UserCredential userCredential = 
        await FirebaseAuth.instance.signInWithCredential(credential);
    
    return userCredential.user;
  }

  /// Sign out
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // Firestore helpers
  static CollectionReference usersCollection = 
      FirebaseFirestore.instance.collection('users');
  
  static CollectionReference habitsCollection(String uid) =>
      usersCollection.doc(uid).collection('habits');
  
  static CollectionReference cyclesCollection(String uid) =>
      usersCollection.doc(uid).collection('cycles');

  /// Save user data
  static Future<void> saveUserData(String uid, Map<String, dynamic> data) async {
    await usersCollection.doc(uid).set(data, SetOptions(merge: true));
  }

  /// Get user data
  static Future<DocumentSnapshot> getUserData(String uid) async {
    return usersCollection.doc(uid).get();
  }
}

