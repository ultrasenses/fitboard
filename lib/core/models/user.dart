import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? username;
  String? email;
  String? photo;
  bool? state;

  UserModel({this.uid, this.email, this.username, this.photo, this.state});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
        uid: doc['uid'],
        email: doc['email'],
        username: doc['username'],
        photo: doc['photo'],
        state: doc['state']);
  }
}
