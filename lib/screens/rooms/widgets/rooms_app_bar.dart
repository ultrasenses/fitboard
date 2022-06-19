import 'package:ultrasenses_fitboard/screens/rooms/widgets/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:ultrasenses_fitboard/core/models/user.dart';

class RoomsAppBar extends StatelessWidget {
  final UserModel profile;
  final void Function() onProfileTab;

  const RoomsAppBar({ Key? key, required this.profile, required this.onProfileTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: onProfileTab,
        child: RoundedImage(
          path: profile.photoUrl,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
