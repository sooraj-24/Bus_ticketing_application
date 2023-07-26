// To parse this JSON data, do
//
//     final bookings = bookingsFromJson(jsonString);

import 'dart:convert';

Bookings bookingsFromJson(String str) => Bookings.fromJson(json.decode(str));

String bookingsToJson(Bookings data) => json.encode(data.toJson());

class Bookings {
  bool? status;
  List<Ticket>? tickets;

  Bookings({
    this.status,
    this.tickets,
  });

  factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
    status: json["status"],
    tickets: json["data"] == null ? [] : List<Ticket>.from(json["data"]!.map((x) => Ticket.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": tickets == null ? [] : List<dynamic>.from(tickets!.map((x) => x.toJson())),
  };
}

class Ticket {
  String? id;
  String? source;
  String? destination;
  DateTime? startTime;
  String? email;
  String? txnId;
  String? busId;
  bool? verified;
  int? v;

  Ticket({
    this.id,
    this.source,
    this.destination,
    this.startTime,
    this.email,
    this.txnId,
    this.busId,
    this.verified,
    this.v,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    id: json["_id"],
    source: json["source"],
    destination: json["destination"],
    startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    email: json["email"],
    txnId: json["txnId"],
    busId: json["busId"],
    verified: json["verified"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "source": source,
    "destination": destination,
    "startTime": startTime?.toIso8601String(),
    "email": email,
    "txnId": txnId,
    "busId": busId,
    "verified": verified,
    "__v": v,
  };
}
