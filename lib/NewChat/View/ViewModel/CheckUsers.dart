import 'dart:convert';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:phone_number/phone_number.dart';
class CheckUsers{
  static getContacts() async{
    print("object");
    Iterable<Contact> contacts = await ContactsService.getContacts();
    String url = "https://us-central1-msg-test-6ae6c.cloudfunctions.net/getKeys";
    var value1 = List.of(contacts.map((e) => List.of(e.phones.map((e) => e.value))));
    var value2 = List.of(value1.map((e) => e.isNotEmpty ? e.elementAt(0): null));
    print(value2);
    var value3 = jsonEncode({"users": value2});
    http.post(url, body: value3).then((value){
      print(value.statusCode);
      if(value.statusCode == 200){
        print(value.body);
      }
    });
  }
  List<String>getPhones(Iterable<Contact> contacts){
    var value = contacts.map((e) => e.phones.first?.value).toList();

    return value;
  }

}