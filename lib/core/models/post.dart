import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? ownerId;
  String? postId;
  String? location;
  DateTime? timeStamp;
  String? username;
  String? des;
  String? mediaUrl;
  int? likesCount;

  PostModel({
    this.ownerId,
    this.postId,
    this.location,
    this.des,
    this.mediaUrl,
    this.timeStamp,
    this.username,
  });

  factory PostModel.fromDocument(DocumentSnapshot doc) {
    return PostModel(
      ownerId: doc['ownerId'],
      postId: doc['postId'],
      timeStamp: doc['timestamp'],
      mediaUrl: doc['mediaUrl'],
      location: doc['location'],
      des: doc['description'],
      username: doc['username'],
    );
  }
}
