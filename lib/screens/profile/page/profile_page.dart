import 'package:flutter/material.dart';
import 'package:ultrasenses_fitboard/core/const/color_constants.dart';
import 'package:ultrasenses_fitboard/core/const/path_constants.dart';
import 'package:ultrasenses_fitboard/core/models/user.dart';

/// Contain information about current user profile

class ProfileScreen extends StatelessWidget {
  final UserModel profile;

  const ProfileScreen({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: profileBody());
  }

  Widget profileBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(children: [
            Stack(alignment: Alignment.topRight, children: [
              Center(
                child: profile.photoUrl == null
                    ? const CircleAvatar(
                        backgroundImage: AssetImage(PathConstants.profile),
                        radius: 60)
                    : CircleAvatar(
                        radius: 60,
                        child: ClipOval(
                            child: FadeInImage.assetNetwork(
                          placeholder: PathConstants.profile,
                          image: profile.photoUrl!,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 120,
                        )),
                      ),
              ),
            ]),
            const SizedBox(height: 15),
            Text(profile.userName,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.textWhite)),
          ]),
        ),
      ),
    );
  }
}
