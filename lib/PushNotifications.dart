  import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert' as convert;

class PushNotificationsManager{
    PushNotificationsManager._();

    factory PushNotificationsManager() => _instance;

    static final PushNotificationsManager _instance = PushNotificationsManager._();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    bool _initialized = false;

    Future<void> init(BuildContext context) async {
      if (!_initialized) {
        // For iOS request permission first.
        _firebaseMessaging.requestNotificationPermissions(
            const IosNotificationSettings(sound: true, badge: true, alert: true));
        _firebaseMessaging.onIosSettingsRegistered
            .listen((IosNotificationSettings settings) {
          print("Settings registered: $settings");
        });
        // For testing purposes print the Firebase Messaging token
        String token = await _firebaseMessaging.getToken();
        print("FirebaseMessaging token: $token");
        _initialized = true;
        _firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) async {
            if (message.containsKey('data')) {
              // Handle data message
              final dynamic data = message['data'];
              print(data["user"]);
              MethodChannel("plugin.register.Notification/notification").invokeMethod("setNotification",data);
            }
            print("onMessage: $message");

          },
          onBackgroundMessage: myBackgroundMessageHandler,
          onLaunch: (Map<String, dynamic> message) async {
            print("onLaunch: $message");
          },
          onResume: (Map<String, dynamic> message) async {
            print("onResume: $message");

          },
        );
      }
    }

    void updateServerToken() async{
      String token = await _firebaseMessaging.getToken();
      String uid = await FirebaseAuth.instance.currentUser().then((value) { return value.uid;});
      var url = "https://us-central1-msg-test-6ae6c.cloudfunctions.net/setToken";
      http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'},
          body: convert.jsonEncode(<String, String>{
          'token': token,
          'user': uid
          })
      ).then((value) {
        print("envio exitoso");
      });

    }
    static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
      if (message.containsKey('data')) {
        // Handle data message
        final dynamic data = message['data'];
        print(data["user"]);
        MethodChannel("plugin.register.Notification/notification").invokeMethod("setNotification",data);
      }


      if (message.containsKey('notification')) {
        // Handle notification message
        final dynamic notification = message['notification'];
      }
      print("onBackground: $message");

      return Future<void>.value();
      // Or do other work.
    }


}
