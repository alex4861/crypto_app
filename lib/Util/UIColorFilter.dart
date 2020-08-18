import 'package:flutter/cupertino.dart';

class UIColorFilter{
  static ColorFilter mode(FilterMode mode){
    List<double> value;
    switch(mode){

      case FilterMode.InvertedWithAlpha:
        value =  [
          //R  G   B    A  Const
          -1, 0, 0, 0, 245, //
          0, -1, 0, 0, 246, //
          0, 0, -1, 0, 248, //
          0, 0, 0, 1, 0, //
        ];
        break;
      case FilterMode.Inverted:
        value =  [
          //R  G   B    A  Const
          -1, 0, 0, 0, 255, //
          0, -1, 0, 0, 255, //
          0, 0, -1, 0, 255, //
          0, 0, 0, 1, 0, //
        ];
        break;

      case FilterMode.Sepia:
        value = [
          //R  G   B    A  Const
          0.393, 0.769, 0.189, 0,0, //
          0.349,0.686,0.168,   0,0, //
          0.272,0.534,0.131,0,0, //
          0, 0, 0, 1, 0, //
        ];
        break;
      case FilterMode.GreyScale:
        value = [
          //R  G   B    A  Const
          0.33, 0.59,0.11, 0,0,//
          0.33,0.59,0.11, 0,0,//
          0.33, 0.59,0.11, 0,0,//
          0, 0, 0, 1, 0, //
        ];

        break;
      case FilterMode.Identity:
        value = [
          //R  G   B    A  Const
          1, 0, 0, 0, 0, //
          0, 1, 0, 0, 0, //
          0, 0, 1, 0, 0, //
          0, 0, 0, 1, 0, //
        ];
        break;
    }
    return ColorFilter.matrix(value);
  }

}
enum FilterMode{
  Inverted,
  InvertedWithAlpha,
  Sepia,
  GreyScale,
  Identity
}
