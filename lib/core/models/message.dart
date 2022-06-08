import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  late String message;
  String? sentBy;
  bool? isPhoto;
  DateTime? timeStamp;

  MessageModel({required this.message, this.timeStamp, this.isPhoto, this.sentBy});

  factory MessageModel.fromDocument(DocumentSnapshot doc) {
    return MessageModel(
        isPhoto: doc['isphoto'],
        message: doc['message'],
        sentBy: doc['sentby'],
        timeStamp: doc['timestamp']);
  }
}
