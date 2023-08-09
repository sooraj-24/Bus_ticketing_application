// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.status,
    required this.message,
    this.data,
  });

  bool status;
  String message;
  Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"] ?? {"":""}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.name,
    this.rollno,
    this.email,
    this.token,
    this.wallet,
  });

  String? name;
  String? rollno;
  String? email;
  String? token;
  int? wallet;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    rollno: json["rollNo"],
    email: json["email"],
    token: json["token"],
    wallet: json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "rollno": rollno,
    "email": email,
    "token": token,
    "wallet": wallet,
  };
}
