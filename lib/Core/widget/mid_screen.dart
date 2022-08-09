import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

import '../../Feature/chess_page/view/chess_view.dart';
import '../methods/text_methods.dart';

class MidScreen extends StatelessWidget {
  const MidScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ChessBoardController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              chess_number("8"),
              chess_number("7"),
              chess_number("6"),
              chess_number("5"),
              chess_number("4"),
              chess_number("3"),
              chess_number("2"),
              chess_number("1"),
            ],
          ),
        ),
        Expanded(
          child: ChessBoard(
            enableUserMoves: false,
            controller: controller,
            boardColor: BoardColor.darkBrown,
            boardOrientation: PlayerColor.white,
            onMove: () {},
            arrows: const [
              //  BoardArrow(from: "b2", to: "b4", color: Colors.red.withOpacity(0.9))
            ],
          ),
        ),
        SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              chess_number("8"),
              chess_number("7"),
              chess_number("6"),
              chess_number("5"),
              chess_number("4"),
              chess_number("3"),
              chess_number("2"),
              chess_number("1"),
            ],
          ),
        ),
      ],
    );
  }
}