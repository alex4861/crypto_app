import 'package:crypto_msn_app/ChatScreen/Bloc/ChatBloc.dart';
import 'package:crypto_msn_app/ChatScreen/Model/ChatMessageModel.dart';
import 'package:flutter/material.dart';

import 'ReceivedMessage.dart';
import 'SendMessage.dart';


class ChatMessages extends StatelessWidget{
  final DefaultItems data = DefaultItems();
  final ChatBloc stream;

  ChatMessages({Key key, this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              ReceivedMessage(text: "Esta es una conversación de prueba",isInitial: true, isFinal: true),
              SendMessage(text: "Para ver el modelo detallado de la app en construccion", isInitial: true,isFinal: true),
              ReceivedMessage(text: "ver si sirve",isInitial: true, isFinal: true),
              ReceivedMessage(text: "ver si sirve", isFinal: true),
              SendMessage(text: "Y obtener un resultado definido en el chat", isInitial: true),
              ReceivedMessage(text: "ok?",isInitial: true,isFinal: true),
              SendMessage(text: "?", isInitial: true, ),
              SendMessage(text: "?",),
              SendMessage(text: "?",),
              SendMessage(text: "?",),
              SendMessage(text: "?",),
              SendMessage(text: "?",),
              SendMessage(text: "?",),
              SendMessage(text: "?",),
              SendMessage(text: "?",),
              SendMessage(text: "?",),
              SendMessage(text: "?",),
              SendMessage(text: "?",),
              SendMessage(text: "?", isFinal: true,),
            ],
          );
        },
      ),
    );
  }

}