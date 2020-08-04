import 'package:crypto_msn_app/ChatsList/ChatsListScreen.dart';
import 'package:crypto_msn_app/FirstEntry/Bloc/AuthViewModel.dart';
import 'package:crypto_msn_app/FirstEntry/Bloc/Prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget{
  final AuthViewModel vm;

  VerificationScreen({Key key, this.vm}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  @override
  void initState() {
    super.initState();
    widget.vm.setCompletedFunction(()  {
      Prefs.sendKey();
      Navigator.of(context).pushAndRemoveUntil(
          (MaterialPageRoute(
              builder: (BuildContext context) => ChatListScreen()
          )
          ), (Route<dynamic> route) => false);
    });
  }
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: 200,
        child: Padding(
          child: Column(
            children: [
              Text("Ingresa el código de verificación"),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        widget.vm.signInWithCode(controller.text);
                      },
                      child: Text("Verificar"),
                    ),
                  )
                ],
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}