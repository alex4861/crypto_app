import 'package:crypto_msn_app/ChatsList/ChatsListScreen.dart';
import 'package:crypto_msn_app/FirstEntry/Bloc/Prefs.dart';
import 'package:crypto_msn_app/FirstEntry/View/FirstScreen.dart';
import 'package:crypto_msn_app/PushNotifications.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
    switch (snapshot.connectionState) {
    case ConnectionState.none:
    case ConnectionState.waiting:
    return new Container();
    default:
    if (!snapshot.hasError) {

      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:  TextTheme(
              button: TextStyle(
                  color: Colors.white
              )
          ),
          primaryColor: Color.fromRGBO(0, 100, 85, 1),
          secondaryHeaderColor: Color.fromRGBO(231, 254, 204, 1),
          accentColor: Color.fromRGBO(0, 100, 85, 1).withAlpha(1),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor:  Color.fromRGBO(92, 200, 85, 1),
          ),
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          buttonColor: Color.fromRGBO(34, 133, 118, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: snapshot.data != null? ChatListScreen() : FirstScreen(),
      );
    } else {
    return new Container(child: snapshot.error);
    }
    }
      },
    );
  }
}