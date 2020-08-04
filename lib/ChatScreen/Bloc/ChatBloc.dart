import 'dart:async';

import 'dart:convert';

import 'package:crypto_msn_app/ChatScreen/Model/ChatMessageModel.dart';
import 'package:cryptography/cryptography.dart';

class ChatBloc implements Bloc{

String _message;
String get message => _message;
  Future<void> sendMessage(String tmessage) async {


    final cipher = chacha20Poly1305Aead;
    final localKeyPair = await x25519.newKeyPair();
    final remoteKeyPair = await x25519.newKeyPair();
    print("public key ${localKeyPair.privateKey}");
    // We can now calculate a shared 256-bit secret
    final secretKey = await x25519.sharedSecret(
      localPrivateKey: localKeyPair.privateKey,
      remotePublicKey: remoteKeyPair.publicKey,
    );
    final secretKey2 = await x25519.sharedSecret(
      localPrivateKey: remoteKeyPair.privateKey,
      remotePublicKey: localKeyPair.publicKey,
    );


    final nonce = Nonce.randomBytes(12);

    final message = utf8.encode(tmessage);
    final encrypted = await cipher.encrypt(message, nonce: nonce, secretKey: secretKey);

    print('Encrypted: $encrypted with nonce $nonce');
    try{
      final decrypted = await cipher.decrypt(
        encrypted,
        secretKey: secretKey2,
        nonce: nonce,
      );
      print('Decrypted: ${utf8.decode(decrypted)}');

    }
    catch(error){
      print(error);
    }






    _locationController.sink.add(tmessage);
  }
  final _locationController2 = StreamController<ChatMessagesModel>();
final _locationController = StreamController<String>();

Stream<ChatMessagesModel> get locationStream => _locationController2.stream;

  @override
  void dispose() {
    _locationController.close();
    _locationController2.close();
  }
}

abstract class Bloc {
  void dispose();
}