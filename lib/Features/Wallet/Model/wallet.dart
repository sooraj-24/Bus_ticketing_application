// To parse this JSON data, do
//
//     final wallet = walletFromJson(jsonString);

import 'dart:convert';

Wallet walletFromJson(String str) => Wallet.fromJson(json.decode(str));

String walletToJson(Wallet data) => json.encode(data.toJson());

class Wallet {
  bool? status;
  int? wallet;
  int? totaltxns;
  List<Transaction>? transactions;

  Wallet({
    this.status,
    this.wallet,
    this.totaltxns,
    this.transactions,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    status: json["status"],
    wallet: json["wallet"],
    totaltxns: json["totaltxns"],
    transactions: json["transactions"] == null ? [] : List<Transaction>.from(json["transactions"]!.map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "wallet": wallet,
    "totaltxns": totaltxns,
    "transactions": transactions == null ? [] : List<dynamic>.from(transactions!.map((x) => x.toJson())),
  };
}

class Transaction {
  String? id;
  int? amount;
  String? email;
  DateTime? date;
  String? type;
  int? v;

  Transaction({
    this.id,
    this.amount,
    this.email,
    this.date,
    this.type,
    this.v,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["_id"],
    amount: json["amount"],
    email: json["email"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    type: json["type"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "amount": amount,
    "email": email,
    "date": date?.toIso8601String(),
    "type": type,
    "__v": v,
  };
}
