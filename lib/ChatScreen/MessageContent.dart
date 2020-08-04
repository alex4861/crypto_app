import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MessageContent extends StatelessWidget{
  final String text;
  final bool isSend;

  const MessageContent({Key key, this.text, this.isSend = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Wrap(
      children: <Widget>[
        Container(
          //We only want to wrap the text message with flexible widget
            child: Text(
              text,
              style: TextStyle(fontSize: 15.4),
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false, applyHeightToLastDescent: false),
              textWidthBasis: TextWidthBasis.longestLine,
            )
        ),
        Container(
          child: Text(
            "11:11 a. m.",
            style: TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
          padding: EdgeInsets.only(left: 6, top: 6, right: 0),
        ),
        isSend? Icon(Icons.done_all, color: Colors.grey, size: 16,):Container(width: 0,),
      ],
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.end,
    );
  }

}