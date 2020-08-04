import 'package:crypto_msn_app/ChatScreen/ChatScreen.dart';
import 'package:crypto_msn_app/FirstEntry/View/FirstScreen.dart';
import 'package:crypto_msn_app/NewChat/View/NewChatScreen.dart';
import 'package:crypto_msn_app/PushNotifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatefulWidget{
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PushNotificationsManager().init(context);
    PushNotificationsManager().updateServerToken();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("WhatsApp"),
        actions: [
          MaterialButton(
            onPressed: (){
              FirebaseAuth.instance.signOut()
                  .then((value) {
                    Navigator.of(context).canPop() ?
                        Navigator.pop(context)
                        :
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> FirstScreen()));
                  });
              },
            child: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return ChatItem();
      },
        padding: EdgeInsets.all(0),
        itemCount: 12,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => NewChatScreen()));
        },
        child: Icon(Icons.comment),
      ),
    );
  }
}

class ChatItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      child:  Container(
          child: Row(
            children: [
              Container(
                child: Image(image: NetworkImage("https://images.contactmusic.com/images/press/example-weekender-march-2014.jpg"), fit: BoxFit.cover,),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(shape: BoxShape.circle),
                height: 60,
                width: 60,
              ),
              Container(width: 10,),
              Expanded(
                child: Column(
                  children: [
                     Expanded(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Text("+52 1 56 1138 3956", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
                               Text("11:11 a.m.", style: TextStyle(color: Colors.grey))
                             ],
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           ),

                           Row(
                             children: [
                               Expanded(
                                 child: Row(
                                   children: [
                                     Icon(Icons.check, color: Colors.grey, size: 18,),
                                     Container(width: 1,),
                                     Container(
                                       child: Flexible(
                                         child: Text("uwuwuwuwuwuwuwuwuwuwuwuwuwuwuywywwuwuuwuwuwuwuuwuwuw",
                                             style: TextStyle(fontSize: 15, color: Colors.grey),
                                             overflow: TextOverflow.ellipsis,
                                           maxLines: 1,
                                         ),
                                       ),
                                     ),
                                   ],
                                   mainAxisAlignment: MainAxisAlignment.start,
                                 ),
                               ),
                               Padding(
                                 child: Icon(Icons.volume_off, color: Colors.grey,),
                                 padding: EdgeInsets.only(right: 10),
                               )
                             ],
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           ),
                         ],
                         mainAxisAlignment: MainAxisAlignment.center,
                       ),
                     ),
                    Divider(height: 1,)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
            ],
          ),
          height: 80,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        ),
       onPressed: () {
        Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>ChatScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  final Tween<Offset> _bottomUpTween = Tween<Offset>(
                  begin: const Offset( 0.25, 0.0),
                  end: Offset.zero,
                );
                 final Animatable<double> _fastOutSlowInTween = CurveTween(curve: Curves.fastOutSlowIn);
                 final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

                final Animation<Offset> _positionAnimation = animation.drive(_bottomUpTween.chain(_fastOutSlowInTween));
                final Animation<double> _opacityAnimation = animation.drive(_easeInTween);



                return SlideTransition(
                  position: _positionAnimation,
                  // TODO(ianh): tell the transform to be un-transformed for hit testing
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: child,
                  ),
                );
              }
            )
        );
        },
      padding: EdgeInsets.all(0),
    );
  }

}