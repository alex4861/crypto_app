import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthViewModel{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void phoneAuthFunc(String phoneNumber, {VoidCallback onSuccess}){
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential _completed) async{
          AuthResult authResult = await _auth.signInWithCredential(_completed);
          FirebaseUser user = authResult.user;
          if (user != null){
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
    if (user != null){
      completed();
    }

  }
  String verificationId;

}