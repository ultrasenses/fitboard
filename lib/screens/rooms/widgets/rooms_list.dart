import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ultrasenses_fitboard/core/models/room.dart';
import 'package:ultrasenses_fitboard/core/models/user.dart';
import 'package:ultrasenses_fitboard/screens/room/page/room_page.dart';
import 'package:ultrasenses_fitboard/screens/rooms/utils/rooms_constants.dart';
import 'package:ultrasenses_fitboard/screens/rooms/widgets/room_card.dart';
import 'package:ultrasenses_fitboard/screens/rooms/widgets/rooms_bottom_sheet.dart';
import 'package:ultrasenses_fitboard/screens/rooms/widgets/rounded_button.dart';

/// Fetch Rooms list from `Firestore`
/// Use `pull_to_refresh` plugin, which provides pull-up load and pull-down refresh for room list

class RoomsList extends StatefulWidget {
  @override
  _RoomsListState createState() => _RoomsListState();
}

class _RoomsListState extends State<RoomsList> {
  // Setting reference to 'rooms' collection
  final collection = FirebaseFirestore.instance.collection('rooms');
  final FirebaseAuth auth = FirebaseAuth.instance;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  final User? user = FirebaseAuth.instance.currentUser;
  String? photoUrl;
  late String userName;
  late String userEmail;

  @override
  void initState() {
    userName = user?.displayName ?? "No Username";
    userEmail = user?.email ?? 'No email';
    photoUrl = user?.photoURL;
    super.initState();
  }

  /// Method for refreshing list

  void _onRefresh() async {
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    _refreshController.refreshCompleted();
  }

  /// Method for loading list

  void _onLoading() async {
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    _refreshController.loadComplete();
  }

  Widget roomCard(RoomModel room) {
    return GestureDetector(
      onTap: () async {
        // Launch user microphone permission
        await Permission.microphone.request();
        // Open BottomSheet dialog
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return RoomScreen(
              room: room,
              // Pass user role
              role: ClientRole.Audience,
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: RoomCard(room: room),
      ),
    );
  }

  /// Adds a smoothed blur at the bottom of the screen when scroll the list

  Widget startRoomButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: RoundedButton(
          disabledColor: RoomsContants.AccentGrey,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              builder: (context) {
                return Wrap(
                  children: [
                    RoomsBottomSheet(
                      onButtonTap: () async {
                        // Add new data to Firestore collection
                        await collection.add(
                          {
                            'title': '${userName}\'s Training',
                            'users': [
                              {
                                'userName': userName,
                                'userEmail': userEmail,
                                'photoUrl': photoUrl,
                              }
                            ],
                            'speakerCount': 1
                          },
                        );
                        // Launch user microphone permission
                        await Permission.microphone.request();
                        Navigator.pop(context);
                        // Open BottomSheet dialog
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return RoomScreen(
                              room: RoomModel(
                                title: '${userName}\'s Training',
                                users: [
                                  UserModel(
                                      userName: userName,
                                      userEmail: userEmail,
                                      photoUrl: photoUrl)
                                ],
                                speakerCount: 1,
                              ),
                              // Pass user role
                              role: ClientRole.Broadcaster,
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
          color: RoomsContants.AccentGreen,
          text: '+ Start a training'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: collection.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              // Handling errors from firebase
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');

              return snapshot.hasData
                  ? SmartRefresher(
                      enablePullDown: true,
                      controller: _refreshController,
                      onRefresh: _onRefresh,
                      onLoading: _onLoading,
                      child: ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return Dismissible(
                            key: ObjectKey(document.data()),
                            onDismissed: (direction) {
                              collection.doc(document.id).delete();
                            },
                            child: roomCard(
                              RoomModel.fromJson(document),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  // Display if still loading data
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
          startRoomButton(),
        ],
      ),
    );
  }
}
