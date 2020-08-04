import 'package:crypto_msn_app/FirstEntry/Bloc/AuthViewModel.dart';
import 'package:crypto_msn_app/FirstEntry/View/VerificationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  final vm = AuthViewModel();
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
              Text("Para comenzar, ingresa tu numero telefonico"),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      child: Text("Continuar"),
                      onPressed: (){
                        vm.phoneAuthFunc("+52${controller.text.trim()}", onSuccess: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => VerificationScreen(vm: vm,)));
                        });
                      },
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