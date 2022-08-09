class MoveModel {
  String? from;
  String? to;

  MoveModel({this.from, this.to});

  Map<String, dynamic> toMap() => {'from': from, 'to': to};

  factory MoveModel.fromMap(Map map) =>
      MoveModel(from: map['from'], to: map['to']);
}
