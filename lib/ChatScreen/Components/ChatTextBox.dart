import 'package:flutter/material.dart';

class ChatTextBox extends StatefulWidget{
  const ChatTextBox({Key key, this.onTap, this.onSendPressed}) : super(key: key);

  @override
  _ChatTextBoxState createState() => _ChatTextBoxState();

  final VoidCallback onTap;
  final TextFieldCallBack onSendPressed;
}

typedef TextFieldCallBack<String> = void Function(String text);

class _ChatTextBoxState extends State<ChatTextBox> with TickerProviderStateMixin{

  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 60,
          maxHeight: 180
        ),
        child: Padding(
          child: Row(
            children: [
              SizedBox(width: 5,),
              Expanded(
                child: ConstrainedBox(
                  child: Container(
                    child:  Container(
                      child: Row(
                        children: [
                          Container(width: 1, height: 0,),
                          MaterialButton(
                            padding: EdgeInsets.all(10),
                            onPressed: (){},
                            child: Icon(Icons.mood, color: Colors.grey, size: 26,),
                            shape: CircleBorder(),
                            minWidth: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration.collapsed(
                                hintText: "Escribe un mensaje",
                                hintStyle: TextStyle(fontSize: 16.5, color: Theme.of(context).textTheme.bodyText2.color),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(height: 1.6, color: Theme.of(context).textTheme.bodyText1.color),
                              onChanged: onWriteAction,
                              cursorColor: Theme.of(context).primaryColor,
                              maxLines: null,
                              minLines: 1,
                              onTap: widget.onTap,
                            ),
                          ),
                          MaterialButton(
                            padding: EdgeInsets.all(10),
                            onPressed: (){},
                            child: Transform.rotate(
                              angle: -0.75,
                              child: Icon(Icons.attach_file, color: Colors.grey, size: 26,),
                            ),
                            shape: CircleBorder(),
                            minWidth: 10,

                          ),
                          camera()

                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      color: Theme.of(context).secondaryHeaderColor.withOpacity(0.9),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                    ),
                    clipBehavior:  Clip.antiAliasWithSaveLayer,
                  ),
                  constraints: BoxConstraints(minHeight: 50, maxHeight: 200),
                ),
              ),
              SizedBox(
                child: MaterialButton(
                  padding: EdgeInsets.all(12),
                  onPressed: !isWrited ? (){} : () => widget.onSendPressed(_textController.text),
                  child: isWrited ?
                        Icon(Icons.send, color: Colors.white,)
                  :Icon(Icons.mic, color: Colors.white,),
                  color: Theme.of(context).buttonColor,
                  shape: CircleBorder(),
                ),
                width: 60,
              ),
            ],
          ),
          padding: EdgeInsets.only(bottom: 8, top: 4),
        ),
      ),
      color: Colors.transparent,

    );
  }

  void onWriteAction(String text){
    setState(() {
      isWrited = text.isNotEmpty;
    });
  }

  bool isWrited = false;
  Widget camera(){
    return
    AnimatedSize(
      child: Container(
        decoration: BoxDecoration(),
        clipBehavior: Clip.antiAlias,
        child: MaterialButton(
          padding: EdgeInsets.all(10),
          onPressed: (){},
          child: Icon(Icons.camera_alt, color: Colors.grey, size: 26,),
          shape: CircleBorder(),
          minWidth: 10,
        ),
        width: isWrited? 0: null,
      ),
      duration: Duration(milliseconds: 150), vsync: this,
    );
  }
}