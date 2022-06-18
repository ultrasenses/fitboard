import 'package:ultrasenses_fitboard/core/models/user.dart';

class RoomModel {
  final String title;
  final List<UserModel> users;
  final int speakerCount;

  RoomModel({
    required this.title,
    required this.users,
    required this.speakerCount,
  });

  factory RoomModel.fromJson(json) {
    return RoomModel(
      title: json['title'],
      users: json['users'].map<UserModel>((user) {
        return UserModel(
          userName: user['userName'],
          userEmail: user['userEmail'],
          photoUrl: user['photoUrl'],
        );
      }).toList(),
      speakerCount: json['speakerCount'],
    );
  }
}
