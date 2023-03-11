import 'dart:convert';

FlashCardModel flashCardModelFromJson(String str) => FlashCardModel.fromJson(json.decode(str));

String flashCardModelToJson(FlashCardModel data) => json.encode(data.toJson());

class FlashCardModel {
  FlashCardModel({
    required this.data,
    required this.message,
  });

  List<Datum> data;
  String message;

  factory FlashCardModel.fromJson(Map<String, dynamic> json) => FlashCardModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
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
