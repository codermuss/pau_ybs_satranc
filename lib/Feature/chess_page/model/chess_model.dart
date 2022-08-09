/*
class ChessModel {
  String? from;
  String? to;

  ChessModel({this.from, this.to});

  Map<String, dynamic> toMap() => {'from': from, 'to': to};

  /// İsimli yapıcı kullanıldığı için buna factory anahtar kelimesi eklenir
  factory ChessModel.fromMap(Map map) =>
      ChessModel(from: map['from'], to: map['to']);
}
*/
import 'dart:convert';

List<ChessModel> chessModelFromJson(String str) =>
    List<ChessModel>.from(json.decode(str).map((x) => ChessModel.fromJson(x)));

String chessModelToJson(List<ChessModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChessModel {
  ChessModel({
    this.fromTo,

  });

  String? fromTo;
  factory ChessModel.fromMap(Map map) =>
      ChessModel(fromTo: map['fromTo']);

  factory ChessModel.fromJson(Map<String, dynamic> json) => ChessModel(
        fromTo: json["from"],

      );
  Map<String, dynamic> toMap() => {'fromTo': fromTo};
  Map<String, dynamic> toJson() => {
        "from": fromTo,

      };

}
