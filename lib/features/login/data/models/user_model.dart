class UserModel {
  final String token;
  final String name;

  UserModel({required this.token, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(token: json["token"], name: json["username"]);
  }
}
