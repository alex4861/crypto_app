import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthViewModel{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void phoneAuthFunc(String phoneNumber, {VoidCallback onSuccess}){
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential _completed) async{
          AuthResult authResult = await _auth.signInWithCredential(_completed);
          FirebaseUser user = authResult.user;
          var url = "https://us-central1-msg-test-6ae6c.cloudfunctions.net/setNumbers";

          if (user != null){
            http.post(url, body: {"number": user.phoneNumber}).then((value){
              print(value.statusCode);
              if(value.statusCode == 200){
                print(value.body);
              }
            });

            completed();
          }
        },
        verificationFailed: onFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: null
    );
    onSuccess();
  }

  void setCompletedFunction(VoidCallback function){
    completed = function;
  }

  void codeSent (String _verificationId, [int forceResendingToken]){
    print("se mando el codigo");

    verificationId = _verificationId;
  }
  Function completed;

  void onFailed(AuthException exception){
    print("failed with ${exception.message}");

  }

  void signInWithCode(String smsCode)  async{
    print(verificationId);
    AuthCredential _authCredential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
    AuthResult result = await FirebaseAuth.instance.signInWithCredential(_authCredential);
    FirebaseUser user = result.user;
    var url = "https://us-central1-msg-test-6ae6c.cloudfunctions.net/setNumbers";

    if (user != null){
      http.post(url, body: {"number": user.phoneNumber}).then((value){
        print(value.statusCode);
        if(value.statusCode == 200){
          print(value.body);
        }
      });

      completed();
    }

  }
  String verificationId;

}