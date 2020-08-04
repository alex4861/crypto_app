import 'package:cryptography/cryptography.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Prefs {
  static Future<bool> isKeySend() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isKeySend");
  }
  static Future<bool> sendKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final localKeyPair = await x25519.newKeyPair();
    var url = "https://us-central1-msg-test-6ae6c.cloudfunctions.net/setKey";
    String uid = await FirebaseAuth.instance.currentUser().then((value) { return value.uid;});
    http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'},
        body: convert.jsonEncode(<String, String>{
          'key': "${localKeyPair.publicKey}",
          'user': uid
        })
    ).then((value) {
      print("envio exitoso");
    });
    return prefs.setBool("isKeySend", true);
  }

}