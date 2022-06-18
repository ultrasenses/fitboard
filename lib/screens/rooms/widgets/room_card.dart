import 'package:flutter/material.dart';
import 'package:ultrasenses_fitboard/core/const/color_constants.dart';
import 'package:ultrasenses_fitboard/core/const/path_constants.dart';
import 'package:ultrasenses_fitboard/core/models/room.dart';
import 'package:ultrasenses_fitboard/screens/rooms/widgets/rounded_image.dart';

/// Each element that fetch from Firestore return the RoomCard

class RoomCard extends StatelessWidget {
  final RoomModel room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.darkModeCardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            room.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,  color: ColorConstants.textWhite,),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              profileImages(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  usersList(),
                  const SizedBox(height: 5),
                  roomInfo(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget profileImages() {
    return Stack(
      children: [
        RoundedImage(
          path: room.users[0].photoUrl ?? PathConstants.profile,
        ),
      ],
    );
  }

  Widget usersList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < room.users.length; i++)
          Row(
            children: [
              Text(
                room.users[i].userName,
                style: const TextStyle(
                  color: ColorConstants.textWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.chat, color: ColorConstants.white, size: 14),
            ],
          )
      ],
    );
  }

  Widget roomInfo() {
    return Row(
      children: [
        Text(
          '${room.users.length}',
          style: const TextStyle(color: ColorConstants.white),
        ),
        const Icon(Icons.supervisor_account, color: ColorConstants.white, size: 14),
        const Text(
          '  /  ',
          style: TextStyle(color: ColorConstants.white, fontSize: 10),
        ),
        Text(
          '${room.speakerCount}',
          style: const TextStyle(color: ColorConstants.white),
        ),
        const Icon(Icons.chat_bubble_rounded, color: ColorConstants.white, size: 14),
      ],
    );
  }
}
