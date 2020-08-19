import 'package:crypto_msn_app/Database/Message.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection{
  Future<Database> _database;
  init() async{
    List<String> execute = [
      //"CREATE TABLE chats(id INTEGER PRIMARY KEY, content TEXT, date TEXT, timestamp TEXT, isSender INTEGER, isInitial INTEGER, isEnd INTEGER, isSend INTEGER, isSee INTEGER, isReceived INTEGER, media BLOB)",
      "CREATE TABLE chatList("
          "id INTEGER PRIMARY KEY, "
          "thumbnail BLOB, "
          "name TEXT, "
          "number TEXT"
          "lastMessage TEXT, "
          "isSend INTEGER, "
          "isSee INTEGER, "
          "isReceived INTEGER, "
          "badge INTEGER, "
          "pendingMessages INTEGER, "
          "isSound INTEGER,"
    ];
    _database = openDatabase(
      join(await getDatabasesPath(), 'chats_database.db'),
      onCreate: (db, version){
        execute.forEach((element) {
          db.execute(element);
        });
        return;
      },
      version: 1,

    );
  }

  void insertMessage(String text, String chat, bool isSender) async{
    final db = await _database;
    final chatMessages  = Message(
      isSender: isSender,
      isReceived: false,
      isInitial: true,
      id: DateTime.now().toIso8601String(),
      isEnd: true,
      media: null,
      isSee: false,
      timestamp: DateTime.now().toIso8601String(),
      content: text,
      isSend: false,
      date: DateTime.now(),
    );
    db.insert(chat, chatMessages.toMap(), conflictAlgorithm: ConflictAlgorithm.replace)
  }

  void createChat(String number) async {
    final db = await _database;
    final name = "$number"+"Chat";
    db.execute(
      "CREATE TABLE [IF NOT EXISTS] $name("
          "id INTEGER PRIMARY KEY, "
          "content TEXT, date TEXT, "
          "timestamp TEXT, "
          "isSender INTEGER, "
          "isInitial INTEGER, "
          "isEnd INTEGER, "
          "isSend INTEGER, "
          "isSee INTEGER, "
          "isReceived INTEGER, "
          "media BLOB"
          ")",
    );
  }

  Future<List<Message>> getMessages() async{
    final Database db = await _database;
    final List<Map<String, dynamic>> maps = await db.query('chats');
    var data = List.generate(maps.length, (i) {
      return Message(
          id: maps[i]['id'],
          content: maps[i]['content'],
          date: maps[i]['date'],
          timestamp: maps[i]['timestamp'],
          isSender: maps[i]['isSender'],
          isInitial: maps[i]['isInitial'],
          isEnd: maps[i]['isEnd'],
          isSend: maps[i]['isSend'],
          isSee: maps[i]['isSee'],
          isReceived: maps[i]['isReceived'],
          media: maps[i]['media']
      );
    });
    if (data == null) {
      data = [];
    }
    return data;
  }
  Future<List<ChatList>> getChats() async{
    final Database db = await _database;
    final List<Map<String, dynamic>> maps = await db.query('chats');
    var data = List.generate(maps.length, (i) {
      return ChatList(
        id: maps[i]['id'],
        thumbnail: maps[i]['thumbnail'],
        name: maps[i]['name'],
        number: maps[i]['number'],
        lastMessage: maps[i]['lastMessage'],
        isSend: maps[i]['isSend'],
        isSee: maps[i]['isSee'],
        isReceived: maps[i]['isReceived'],
        badge: maps[i]['badge'],
        pendingMessages: maps[i]['pendingMessages'],
        isSound: maps[i]['isSound'],
      );
    });
    if (data == null) {
      data = [];
    }
    return data;
  }



}
