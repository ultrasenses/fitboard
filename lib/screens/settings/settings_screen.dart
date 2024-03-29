import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ultrasenses_fitboard/core/const/color_constants.dart';
import 'package:ultrasenses_fitboard/core/const/path_constants.dart';
import 'package:ultrasenses_fitboard/core/const/text_constants.dart';
import 'package:ultrasenses_fitboard/core/service/auth_service.dart';
import 'package:ultrasenses_fitboard/screens/common_widgets/settings_container.dart';
import 'package:ultrasenses_fitboard/screens/edit_account/edit_account_screen.dart';
import 'package:ultrasenses_fitboard/screens/reminder/page/reminder_page.dart';
import 'package:ultrasenses_fitboard/screens/settings/bloc/bloc/settings_bloc.dart';
import 'package:ultrasenses_fitboard/screens/sign_in/page/sign_in_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? photoUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContext(context));
  }

  BlocProvider<SettingsBloc> _buildContext(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(),
      child: BlocConsumer<SettingsBloc, SettingsState>(
        buildWhen: (_, currState) => currState is SettingsInitial,
        builder: (context, state) {
          return _settingsContent(context);
        },
        listenWhen: (_, currState) => true,
        listener: (context, state) {},
      ),
    );
  }

  Widget _settingsContent(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? "No Username";
    photoUrl = user?.photoURL;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(children: [
            Stack(alignment: Alignment.topRight, children: [
              Center(
                child: photoUrl == null
                    ? const CircleAvatar(backgroundImage: AssetImage(PathConstants.profile), radius: 60)
                    : CircleAvatar(
                        radius: 60,
                        child: ClipOval(
                            child: FadeInImage.assetNetwork(
                          placeholder: PathConstants.profile,
                          image: photoUrl!,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 120,
                        )),
                      ),
              ),
              TextButton(
                  onPressed: () async {
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => const EditAccountScreen()));
                    setState(() {
                      photoUrl = user?.photoURL;
                    });
                  },
                  style: TextButton.styleFrom(shape: const CircleBorder(), backgroundColor: ColorConstants.primaryColor.withOpacity(0.16)),
                  child: const Icon(Icons.edit, color: ColorConstants.primaryColor)),
            ]),
            const SizedBox(height: 15),
            Text(displayName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ColorConstants.textWhite)),
            const SizedBox(height: 15),
            SettingsContainer(
              withArrow: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ReminderPage()));
              },
              child: const Text(TextConstants.reminder, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: ColorConstants.textWhite)),
            ),
            if (!kIsWeb)
              SettingsContainer(
                child: Text(TextConstants.rateUsOn + (Platform.isIOS ? 'App store' : 'Play market'),
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: ColorConstants.textWhite)),
                onTap: () {
                  return launch(Platform.isIOS ? 'https://www.apple.com/app-store/' : 'https://play.google.com/store');
                },
              ),
            SettingsContainer(
                onTap: () => launch('https://fitboard.space/'), child: const Text(TextConstants.terms, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: ColorConstants.textWhite))),
            SettingsContainer(
                child: const Text(TextConstants.signOut, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: ColorConstants.textWhite)),
                onTap: () {
                  AuthService.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SignInPage()),
                  );
                }),
            const SizedBox(height: 15),
            const Text(TextConstants.joinUs, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: ColorConstants.textWhite)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => launch('https://www.facebook.com/perpetio/'),
                    style: TextButton.styleFrom(shape: const CircleBorder(), backgroundColor: ColorConstants.darkModeCardColor, elevation: 1),
                    child: Image.asset(PathConstants.facebook)),
                TextButton(
                    onPressed: () => launch('https://www.instagram.com/perpetio/'),
                    style: TextButton.styleFrom(shape: const CircleBorder(), backgroundColor: ColorConstants.darkModeCardColor, elevation: 1),
                    child: Image.asset(PathConstants.instagram)),
                TextButton(
                    onPressed: () => launch('https://twitter.com/perpetio'),
                    style: TextButton.styleFrom(shape: const CircleBorder(), backgroundColor: ColorConstants.darkModeCardColor, elevation: 1),
                    child: Image.asset(PathConstants.twitter)),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
