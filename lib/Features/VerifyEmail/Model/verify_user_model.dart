// To parse this JSON data, do
//
//     final verifyUserModel = verifyUserModelFromJson(jsonString);

import 'dart:convert';

VerifyUserModel verifyUserModelFromJson(String str) => VerifyUserModel.fromJson(json.decode(str));

String verifyUserModelToJson(VerifyUserModel data) => json.encode(data.toJson());

class VerifyUserModel {
  VerifyUserModel({
    required this.status,
    required this.message,
    required this.email,
  });

  bool status;
  String message;
  String email;

  factory VerifyUserModel.fromJson(Map<String, dynamic> json) => VerifyUserModel(
    status: json["status"],
    message: json["message"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "email": email,
  };
}
