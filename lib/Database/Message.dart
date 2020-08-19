import 'dart:core';

import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Message {
  final String id;
  final String content;
  final DateTime date;
  final String timestamp;
  final bool isSender;
  final bool isInitial;
  final bool isEnd;
  final bool isSend;
  final bool isSee;
  final bool isReceived;
  final media;

  Message({
    @required this.id,
    @required this.content,
    @required this.date,
    @required this.timestamp,
    @required this.isSender,
    @required this.isInitial,
    @required this.isEnd,
    @required this.isSend,
    @required this.isSee,
    @required this.isReceived,
    @required this.media
  });

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'content': content,
      'date': date,
      'timestamp': timestamp,
      'isSender': isSender,
      'isInitial': isInitial,
      'isEnd': isEnd,
      'isSend': isSend,
      'isSee': isSee,
      'isReceived': isReceived,
      'media': media,

    };
  }
}

class ChatList {
  final String id;
  final Image thumbnail;
  final String name;
  final String number;
  final String lastMessage;
  final bool isSend;
  final bool isSee;
  final bool isReceived;
  final int badge;
  final bool pendingMessages;
  final bool isSound;

  ChatList({this.id, this.thumbnail, this.name, this.number, this.lastMessage, this.isSend, this.isSee, this.isReceived, this.badge, this.pendingMessages, this.isSound});


  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'thumbnail': thumbnail,
      'name': name,
      'lastMessage': lastMessage,
      'isSend': isSend,
      'isSee': isSee,
      'isReceived': isReceived,
      'badge': badge,
      'pendingMessages': pendingMessages,
      'isSound': isSound,

    };
  }
}
class ProfileView {
  final String id;
  final Image image;
  final bool isSound;
  final String numberPhone;
  final DateTime lastSee;

  ProfileView(this.image, this.isSound, this.numberPhone, this.lastSee, this.id);


  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'image': image,
      'isSound': isSound,
      'numberPhone': numberPhone,
      'lastSee': lastSee,
    };
  }
}