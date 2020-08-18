import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Column(
        children: [
          Text("+52 1 56 1138 3956",style: TextStyle(fontSize: 18)),
          Text("en línea", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),)
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
      leading: ConstrainedBox(
        constraints:  BoxConstraints(maxWidth: 100, minWidth: 100, maxHeight: 20),
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Container(
              padding: EdgeInsets.only(left: 3),
              child: MaterialButton(
                textColor: Colors.white,
                child: FittedBox(
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, size: 26,),
                      Container(
                        child: Image(image: NetworkImage("https://images.contactmusic.com/images/press/example-weekender-march-2014.jpg"), fit: BoxFit.cover,),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        height: 35,
                        width: 35,
                      ),
                      Container(width: 1,)
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  fit: BoxFit.fitWidth,
                ),
                onPressed: (){Navigator.of(context).pop();},
                padding: EdgeInsets.all(0),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(18, 20)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
          ),
        ),
      ),
      actions: [
        CircleButton(
          onPressed: (){},
          child: Icon(Icons.videocam),
        ),
        CircleButton(
          onPressed: (){},
          child: Icon(Icons.phone),
        ),
        CircleButton(
          onPressed: (){},
          child: Icon(Icons.more_vert),
        ),
      ],
      titleSpacing: NavigationToolbar.kMiddleSpacing-5,

    );
  }

  final AppBar _appbar = AppBar();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => _appbar.preferredSize;

}
class CircleButton extends StatelessWidget{
  final Icon child;
  final VoidCallback onPressed;

  const CircleButton({Key key, this.child, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      padding: EdgeInsets.all(6),
      onPressed: onPressed,
      child: child,
      textColor: Colors.white,
      shape: CircleBorder(),
      minWidth: 10,

    );
  }

}