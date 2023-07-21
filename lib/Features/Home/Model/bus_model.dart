// To parse this JSON data, do
//
//     final busResponse = busResponseFromJson(jsonString);

import 'dart:convert';

BusResponse busResponseFromJson(String str) => BusResponse.fromJson(json.decode(str));

String busResponseToJson(BusResponse data) => json.encode(data.toJson());

class BusResponse {
  bool? status;
  List<Bus>? data;

  BusResponse({
    this.status,
    this.data,
  });

  factory BusResponse.fromJson(Map<String, dynamic> json) => BusResponse(
    status: json["status"],
    data: json["data"] == null ? [] : List<Bus>.from(json["data"]!.map((x) => Bus.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Bus {
  String? id;
  String? source;
  String? destination;
  DateTime? startTime;
  int? capacity;
  int? initialCapacity;
  List<String>? stops;
  List<String>? days;
  bool? sessionStart;
  int? v;

  Bus({
    this.id,
    this.source,
    this.destination,
    this.startTime,
    this.capacity,
    this.initialCapacity,
    this.stops,
    this.days,
    this.sessionStart,
    this.v,
  });

  factory Bus.fromJson(Map<String, dynamic> json) => Bus(
    id: json["_id"],
    source: json["source"],
    destination: json["destination"],
    startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    capacity: json["capacity"],
    initialCapacity: json["initialCapacity"],
    stops: json["stops"] == null ? [] : List<String>.from(json["stops"]!.map((x) => x)),
    days: json["days"] == null ? [] : List<String>.from(json["days"]!.map((x) => x)),
    sessionStart: json["sessionStart"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "source": source,
    "destination": destination,
    "startTime": startTime?.toIso8601String(),
    "capacity": capacity,
    "initialCapacity": initialCapacity,
    "stops": stops == null ? [] : List<dynamic>.from(stops!.map((x) => x)),
    "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x)),
    "sessionStart": sessionStart,
    "__v": v,
  };
}
