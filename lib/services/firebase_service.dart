import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dot/commonWidgets/common_ui.dart';
import 'package:dot/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  static String? fcmToken;
  // INIT
  static init() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      
      fcmToken = await messaging.getToken();
      print('fcmToken: ${await messaging.getToken()}');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          print('Message also contained a notification: ${message.notification}');
        }
      });

      setupInteractedMessage();

    } catch(e, s) {
      print('Error: $e,STACKTRACE: $s');
    }
  }

  static Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessageTerminate(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageBackground);
  }

  static void _handleMessageTerminate(RemoteMessage message) {
    print('Message in _handleMessageTerminate ${message.data}');
    if(customContext != null) {
      CommonUI.testSnackBar(customContext!, 'Hey Terminated Dot', fcmToken.toString());
    }
  }

  static void _handleMessageBackground(RemoteMessage message) {
    print('Message in _handleMessageBackground ${message.data}');
    if(customContext != null) {
      CommonUI.testSnackBar(customContext!, 'Hey Background Dot', fcmToken.toString());
    }
  }


  // TO CREATE A NEW USER
  static createNewUser(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
        'uid': credential.user!.uid,
        'email': emailAddress
      });
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return e.code;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return e.code;
      }
    } catch (e) {
      print(e);
    }
  }

  // TO LOGIN
  static login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
        'uid': credential.user!.uid,
        'email': emailAddress
      }, SetOptions(merge: true));
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return e.code;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return e.code;
      }
    }
  }

  // TO LOGGED OUT
  static logout() async {
    await FirebaseAuth.instance.signOut();
  }
}