// To parse this JSON data, do
//
//     final allFlashCardModel = allFlashCardModelFromJson(jsonString);

import 'dart:convert';

AllFlashCardModel allFlashCardModelFromJson(String str) => AllFlashCardModel.fromJson(json.decode(str));

String allFlashCardModelToJson(AllFlashCardModel data) => json.encode(data.toJson());

class AllFlashCardModel {
  AllFlashCardModel({
    required this.data,
  });

  List<Datum> data;

  factory AllFlashCardModel.fromJson(Map<String, dynamic> json) => AllFlashCardModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.sn,
    required this.uid,
    required this.category,
    required this.question,
    required this.answer,
    required this.thumbnail,
    required this.createdDate,
  });

  int sn;
  String uid;
  String category;
  String question;
  String answer;
  String thumbnail;
  DateTime createdDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    sn: json["sn"],
    uid: json["uid"],
    category: json["category"],
    question: json["question"],
    answer: json["answer"],
    thumbnail: json["thumbnail"],
    createdDate: DateTime.parse(json["created_date"]),
  );

  Map<String, dynamic> toJson() => {
    "sn": sn,
    "uid": uid,
    "category": category,
    "question": question,
    "answer": answer,
    "thumbnail": thumbnail,
    "created_date": createdDate.toIso8601String(),
  };
}
