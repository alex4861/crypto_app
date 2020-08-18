import 'package:crypto_msn_app/ChatScreen/Bloc/ChatBloc.dart';
import 'package:crypto_msn_app/Database/DatabaseConnection.dart';
import 'package:crypto_msn_app/Database/Message.dart';
import 'package:flutter/material.dart';

import 'Components/ReceivedMessage.dart';
import 'Components/SendMessage.dart';


class ChatMessages extends StatefulWidget{
  final ChatBloc stream;

  ChatMessages({Key key, this.stream}) : super(key: key);

  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  final stream = ChatBloc();
  final DatabaseConnection database = DatabaseConnection();
  @override
  void initState() {
    super.initState();
    getDB();
  }

  Future<List<Message>> getDB () async{
    await database.init();
    return database.getMessages();
  }

  @override
  Widget build(BuildContext context) {
    print("building");
    // TODO: implement build
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<List<Message>> snapshot) {
        List<Message> data = snapshot.data;
        if(snapshot.connectionState == ConnectionState.done){
          return Container(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (BuildContext context, int index) {
                return getTypeMessage(data[index]);
              },
              itemCount: data.length,
            ),
          );
        }
        else{
          return Container();
        }
      },
      future: getDB(),
    );
  }

  Widget getTypeMessage(Message data){
    if(data.isSender){
      return SendMessage(text: data.content, isInitial: data.isInitial, isFinal: data.isEnd,);
    }
    else{
      return ReceivedMessage(text: data.content, isInitial: data.isInitial, isFinal: data.isEnd,);
    }
  }
}