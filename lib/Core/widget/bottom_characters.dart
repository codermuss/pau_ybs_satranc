
import 'package:flutter/material.dart';

import '../methods/text_methods.dart';

class BottomCharacters extends StatelessWidget {
  const BottomCharacters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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

