import 'package:flutter/material.dart';

import '../../Feature/chess_page/view/chess_view.dart';
import '../methods/text_methods.dart';

class TopCharachters extends StatelessWidget {
  const TopCharachters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        chess_text("a"),
        chess_text("b"),
        chess_text("c"),
        chess_text("d"),
        chess_text("e"),
        chess_text("f"),
        chess_text("g"),
        chess_text("h"),
      ],
    );
  }
}
