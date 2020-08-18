import 'package:crypto_msn_app/ChatsList/ChatsListScreen.dart';
import 'package:crypto_msn_app/FirstEntry/View/FirstScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';

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
    return MaterialApp(
      theme: ThemeData(
          textTheme:  TextTheme(
              button: TextStyle(
                  color: Colors.white
              ),
              bodyText1: TextStyle(
                  color: Colors.black
              ),
              bodyText2: TextStyle(
                  color: Colors.black.withOpacity(0.5)
              )
          ),
          primaryColor: Color.fromRGBO(0, 100, 85, 1),
          secondaryHeaderColor: Colors.white,
          cardColor: Color.fromRGBO(231, 254, 204, 1),
          accentColor: Color.fromRGBO(0, 100, 85, 1).withAlpha(1),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor:  Color.fromRGBO(92, 200, 85, 1),
          ),
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          buttonColor: Color.fromRGBO(34, 133, 118, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryTextTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))

      ),


      darkTheme: ThemeData(
          textTheme:  TextTheme(
              button: TextStyle(
                  color: Colors.white //
              ),
              bodyText1: TextStyle(
                  color: Colors.white.withOpacity(0.8)
              ),
              bodyText2: TextStyle(
                  color: Colors.white.withOpacity(0.5)
              )

          ),
          appBarTheme: AppBarTheme(color: Color.fromRGBO(33, 46, 53, 1)),
        scaffoldBackgroundColor: Color.fromRGBO(19, 30, 36, 1),//Scaffold color
        secondaryHeaderColor: Color.fromRGBO(33, 46, 53, 1),//RECEIVER MESSAGE
        accentColor: Color.fromRGBO(0, 100, 85, 1).withAlpha(1),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:  Color.fromRGBO(23, 171, 144, 1),
        ),
        cardColor: Color.fromRGBO(32, 75, 71, 1),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        canvasColor: Color.fromRGBO(0, 100, 85, 1).withAlpha(1),

        buttonColor: Color.fromRGBO(34, 133, 118, 1),// Send button
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryTextTheme: TextTheme(bodyText1: TextStyle(color: Colors.grey))
      ),




      home: FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return  Scaffold(body: Container());
            default:
              if (!snapshot.hasError) {

                return snapshot.data != null? ChatListScreen() : FirstScreen();
              } else {
                return Scaffold(
                  body: Container(child: snapshot.error)
                );
              }
          }
        },
      ),
    );
  }

  Future<FirebaseUser> initTask() async{
    await _getPermission();
    await Permission.contacts.request();
    return FirebaseAuth.instance.currentUser();
  }

  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
      await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }

}


