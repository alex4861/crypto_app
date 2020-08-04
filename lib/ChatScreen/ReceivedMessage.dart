import 'package:crypto_msn_app/ChatScreen/MessageContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReceivedMessage extends StatelessWidget{
  final String text;
  final bool isInitial;
  final bool isFinal;

  const ReceivedMessage({Key key, this.text = "Esta es una conversación de prueba", this.isInitial = false, this.isFinal = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      child: Container(
        child: Row(
          //this will determine if the message should be displayed left or right
          children: [
            Flexible(

              //Wrapping the container with flexible widget
              child: Padding(
                child: Material(
                  child:Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                      child: MessageContent(text: text,)
                  ),
                  elevation: 1,
                  shape: isInitial ? _TrianglePath(): RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left: 10),
              ),

            ),


          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
      padding: EdgeInsets.only(left: 6, right: 80, top: isInitial? 3: 2, bottom: isFinal? 3 : 2),
    );
  }
}

class _TrianglePath extends ShapeBorder{
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: 10);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
     Path path = Path()
      ..addRRect(
          RRect.fromRectAndCorners(
            rect,
            bottomRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            topRight: Radius.circular(6)
          )
      )
      ..moveTo(0, 0)
      ..relativeLineTo(-6, 0)
       ..relativeQuadraticBezierTo(-4, 1, 0, 4)
       ..relativeLineTo(6, 7)
       ..close();
     return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;

}