import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pau_ybs_satranc/Feature/chess_page/service/chess_firestore_service.dart';

import '../model/chess_model.dart';

/// chessview'ın state bilgisini tutar
/// chessview arayüzünün ihtiyacı olan metotları ve hesaplamaları yapar
/// gerekli servislerle iletişime geçer
class ChessViewModel extends ChangeNotifier {
  String ref = "newgame";
  ChessModel? moves;
  ChessFireStoreService _chessFireStoreService = ChessFireStoreService();

   Stream<ChessModel> getChessList(){

   Stream<DocumentSnapshot> docSnap=  _chessFireStoreService.getChessModelStream();

   Stream<ChessModel> streamListChess= docSnap.map(_chessFireStoreService.chessModelFromSnapshot);
   return streamListChess;

  }













/*  Stream<ChessModel> getMoveData() {
    /// Stream<QuerySnapshot> --> Stream<List<DocumentSnapshot>> --> Stream<List<ChessModel>>
    ///QuerySnapshot içindeki dökümanları alır
    ///streamDoc DocumentSnapshot'ları içerir
  *//*  var streamListDocument =
        _chessFireStoreService.getData(ref).map((event) => ChessModel.fromJson(event!)).toList();
    print("viewModel icindexx");
    var list= await streamListDocument;
    print("viewModel icinde");
    print("xxxxxxx ${list.first.from}");
*//*
    ///Stream<List<DocumentSnapshot>> --> Stream<List<ChessModel>>
    ///

    //var data=streamListDocument.map((listOfDocuments) => listOfDocuments.map((e) => ChessModel.fromJson(e.data()))).toList();
*//*

  print("1");
  var streamListChess=_chessFireStoreService.getData(ref);
  print("2");
  var x= await streamListChess;
  print("3");
  print(x.first.from);
*//*

  return _chessFireStoreService.getChessModelStream();
  }*/

}
