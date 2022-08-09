import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/chess_model.dart';

class ChessFireStoreService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  ChessModel chessModelFromSnapshot(DocumentSnapshot snapshot) {
    return ChessModel(
      fromTo: snapshot['fromTo'],
    );
  }

  Stream<DocumentSnapshot> getChessModelStream() {
    return _database
        .collection('newgame')
        .doc('moves')
        .snapshots(); //.map((chessModelFromSnapshot));
  }

  Stream<QuerySnapshot> getChessModelFromApi() {
    return _database.collection("newgame").snapshots();
  }
}
