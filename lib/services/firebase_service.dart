import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  static bool _initialized = false;

  /// Initialize Firebase
  static Future<void> initialize() async {
    if (_initialized) return;
    
    await Firebase.initializeApp();
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
  static Future<User> signInWithGoogle() async {
    // Note: Requires GoogleSignIn and OAuth configuration
    // For now, using anonymous auth
    return signInAnonymously();
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

class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  /// Request notification permissions
  static Future<void> requestPermissions() async {
    await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  /// Get FCM token
  static Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  /// Subscribe to topic
  static Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  /// Unsubscribe from topic
  static Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }

  /// Configure notification handling
  static void configure() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground notifications
      print('Message data: ${message.data}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle notification tap
      print('Notification tapped: ${message.data}');
    });
  }

  /// Schedule daily reminder
  static Future<void> scheduleDailyReminder({
    required int hour,
    required int minute,
    required String title,
    required String body,
  }) async {
    // Note: For scheduling, you'd use flutter_local_notifications
    // This is placeholder for local notifications
    print('Daily reminder scheduled for $hour:$minute');
  }
}
