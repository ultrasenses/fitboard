class UserModel {
  String userName;
  String userEmail;
  String? photoUrl;

  UserModel({required this.userName, required this.userEmail, this.photoUrl});

  factory UserModel.fromJson(json) {
    return UserModel(
      userName: json['userName'],
      userEmail: json['userEmail'],
      photoUrl: json['photoUrl'],
    );
  }
}
