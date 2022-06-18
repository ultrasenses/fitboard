import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ultrasenses_fitboard/core/const/color_constants.dart';
import 'package:ultrasenses_fitboard/core/const/env_constants.dart';
import 'package:ultrasenses_fitboard/core/models/room.dart';
import 'package:ultrasenses_fitboard/core/models/user.dart';
import 'package:ultrasenses_fitboard/screens/room/widgets/user_profile.dart';
import 'package:ultrasenses_fitboard/screens/rooms/utils/rooms_constants.dart';
import 'package:ultrasenses_fitboard/screens/rooms/widgets/rounded_button.dart';
import 'package:ultrasenses_fitboard/screens/rooms/widgets/rounded_image.dart';
import 'package:ultrasenses_fitboard/screens/settings/settings_screen.dart';

/// Detail screen of selected room
/// Initialize Agora SDK

class RoomScreen extends StatefulWidget {
  final RoomModel room;
  final ClientRole role;

  const RoomScreen({Key? key, required this.room, required this.role})
      : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  late UserModel profile;

  final List _users = [];

  bool muted = false;
  late RtcEngine _engine;

  @override
  void initState() {
    profile = UserModel(
        userName: user?.displayName ?? "No Username",
        userEmail: user?.email ?? 'No email',
        photoUrl: user?.photoURL);
    super.initState();
    // Initialize Agora SDK
    initialize();
  }

  @override
  void dispose() {
    // Clear users
    _users.clear();
    // Destroy sdk
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  /// Create Agora SDK instance and initialize
  Future<void> initialize() async {
    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    // await _engine.leaveChannel();
    await _engine.joinChannel(
        EnvConstants.Token, EnvConstants.channelName, null, 0);
  }

  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(EnvConstants.APP_ID);
    await _engine.enableAudio();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(widget.role);
  }

  /// Add Agora event handlers

  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(
      error: (code) {
        setState(() {
          print('onError: $code');
        });
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        print('onJoinChannel: $channel, uid: $uid');
      },
      leaveChannel: (stats) {
        setState(() {
          print('onLeaveChannel');
          _users.clear();
        });
      },
      userJoined: (uid, elapsed) {
        print('userJoined: $uid');
        setState(() {
          _users.add(uid);
        });
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        toolbarHeight: 150,
        bottomOpacity: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              'All training rooms',
              style: TextStyle(color: ColorConstants.textWhite, fontSize: 16),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen())),
              child: RoundedImage(
                path: profile.photoUrl,
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80, top: 20),
            child: Column(
              children: [
                title(widget.room.title),
                SizedBox(height: 30),
                speakers(
                  widget.room.users.sublist(0, widget.room.speakerCount),
                ),
                others(
                  widget.room.users.sublist(widget.room.speakerCount),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottom(context),
          ),
        ],
      ),
    );
  }

  Widget title(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: Icon(Icons.more_horiz),
          ),
        ),
      ],
    );
  }

  Widget speakers(List<UserModel> users) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: users.length,
      itemBuilder: (gc, index) {
        return UserProfile(
          user: users[index],
          isModerator: index == 0,
          isMute: false,
          size: 80,
        );
      },
    );
  }

  Widget others(List<UserModel> users) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Others in training room',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey.withOpacity(0.6),
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: users.length,
          itemBuilder: (gc, index) {
            return UserProfile(user: users[index], size: 60);
          },
        ),
      ],
    );
  }

  Widget bottom(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          RoundedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: RoomsContants.LightGrey,
            disabledColor: RoomsContants.AccentGrey,
            child: Text(
              '✌️ Leave quietly',
              style: TextStyle(
                  color: RoomsContants.AccentRed,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          RoundedButton(
            onPressed: () {
              Navigator.of(context).pop();
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return RoomScreen(
                    room: widget.room,
                    role: ClientRole.Broadcaster,
                  );
                },
              );
            },
            color: RoomsContants.LightGrey,
            disabledColor: RoomsContants.AccentGrey,
            isCircle: true,
            child: Icon(Icons.hail, size: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
