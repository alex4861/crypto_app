import 'package:flutter/cupertino.dart';

class MessageModel {
  final String message;
  final bool isSend;

  MessageModel({@ required this.message, @required this.isSend});
}

class ChatMessagesModel{
  final List<MessageModel> messages;

  ChatMessagesModel({@required this.messages});
}

class DefaultItems{
  ChatMessagesModel get items {
    return ChatMessagesModel(
        messages: [
          MessageModel(
            message: "Esta es una conversación de prueba",
            isSend: false,
          ),
          MessageModel(
            message: "Para ver el modelo detallado de la app en construccion",
            isSend: true,
          ),
          MessageModel(
            message: "ver si sirve",
            isSend: false,
          ),
          MessageModel(
            message: "ver si sirve",
            isSend: false,
          ),
          MessageModel(
            message: "Y obtener un resultado definido en el chat",
            isSend: true,
          ),
          MessageModel(
            message: "ok?",
            isSend: false,
          ),
          MessageModel(
            message: "?",
            isSend: true,
          ),
          MessageModel(
            message: "?",
            isSend: true,
          ),
          MessageModel(
            message: "?",
            isSend: true,
          ),
          MessageModel(
            message: "?",
            isSend: true,
          ),
          MessageModel(
            message: "?",
            isSend: true,
          ),
          MessageModel(
            message: "?",
            isSend: true,
          ),
          MessageModel(
            message: "?",
            isSend: true,
          ),
          MessageModel(
            message: "?",
            isSend: true,
          ),
          MessageModel(
            message: "?",
            isSend: true,
          ),
          MessageModel(
            message: "?",
            isSend: true,
          ),

        ]
    );
  }
}

//            ReceivedMessage(text: "Esta es una conversación de prueba",isInitial: true, isFinal: true),
//            SendMessage(text: "Para ver el modelo detallado de la app en construccion", isInitial: true,isFinal: true),
//            ReceivedMessage(text: "ver si sirve",isInitial: true, isFinal: true),
//            ReceivedMessage(text: "ver si sirve", isFinal: true),
//            SendMessage(text: "Y obtener un resultado definido en el chat", isInitial: true),
//            ReceivedMessage(text: "ok?",isInitial: true,isFinal: true),
//            SendMessage(text: "?", isInitial: true, ),
//            SendMessage(text: "?",),
//            SendMessage(text: "?",),
//            SendMessage(text: "?",),
//            SendMessage(text: "?",),
//            SendMessage(text: "?",),
//            SendMessage(text: "?",),
//            SendMessage(text: "?",),
//            SendMessage(text: "?",),
//            SendMessage(text: "?",),
//            SendMessage(text: "?",),
//            SendMessage(text: "?",),
//            SendMessage(text: "?", isFinal: true,),