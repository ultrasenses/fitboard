import 'package:flutter/painting.dart';
import 'package:ultrasenses_fitboard/core/const/path_constants.dart';

///static class contains all App colors

class RoomsContants {
  static const LightBrown = Color(0xfff1efe5);
  static const LightGreen = Color(0xffE8FCD9);
  static const LightGrey = Color(0xfff2f2f2);
  static const AccentRed = Color(0xffDA6864);
  static const AccentGreen = Color(0xff55AB67);
  static const AccentBrown = Color(0xffE6E2D6);
  static const AccentBlue = Color(0xff5B75A6);
  static const AccentGrey = Color(0xff807970);
  static const DarkBrown = Color(0xff918E81);
  static const SelectedItemGrey = Color(0xffCCCFDC);
  static const SelectedItemBorderGrey = Color(0xffC5C5CF);

  static const List bottomSheetData = [
    {
      'image': PathConstants.inProgress,
      'text': 'Open',
      'selectedMessage': 'Start a training open to everyone',
    },
    {
      'image': PathConstants.finished,
      'text': 'Social',
      'selectedMessage': 'Start a training with people I follow',
    },
    {
      'image': PathConstants.timeSent,
      'text': 'Closed',
      'selectedMessage': 'Start a training for people I choose',
    },
  ];
}
