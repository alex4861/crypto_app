
import 'package:crypto_msn_app/ChatScreen/Bloc/ChatBloc.dart';
import 'package:crypto_msn_app/ChatScreen/Components/ChatAppBar.dart';
import 'package:crypto_msn_app/ChatScreen/ChatMessages.dart';
import 'package:crypto_msn_app/ChatScreen/Components/ChatTextBox.dart';
import 'package:crypto_msn_app/Util/UIColorFilter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatelessWidget{
  final stream = ChatBloc();


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: ChatAppBar(),
      body:  Container(
        child: Container(
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ChatMessages(stream: stream,),
                ),
                ChatTextBox(onTap: (){}, onSendPressed: (text){stream.sendMessage(text);},),
              ],
            ),
            backgroundColor: Colors.transparent,

          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://i.pinimg.com/originals/ab/ab/60/abab60f06ab52fa7846593e6ae0c9a0b.png"),
                fit: BoxFit.cover,
                colorFilter: MediaQuery.of(context).platformBrightness
                    == Brightness.dark ? UIColorFilter.mode(FilterMode.InvertedWithAlpha) : null
            ),
          ),
        ),
        color: Colors.blue
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
