import 'package:crypto_msn_app/ChatScreen/Components/ChatAppBar.dart';
import 'package:crypto_msn_app/NewChat/View/ViewModel/CheckUsers.dart';
import 'package:flutter/material.dart';

class NewChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    CheckUsers.getContacts();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          CircleButton(
            child: Icon(Icons.search),
            onPressed: (){},
          ),
          CircleButton(
            child: Icon(Icons.more_vert),
            onPressed: (){},
          )
        ],
        title: Column(
          children: [
            Text("Contactos",style: TextStyle(fontSize: 18)),
            Text("1 Contactos", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),)
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
      body: Container(),
    );
  }

}