import 'package:flutter/material.dart';

import '../../Product/Style/text_styles.dart';

Text chess_number(String text) => Text(
  text,
  style: StyleText().textStyleUserDetailTitle,
);

Padding chess_text(String text) => Padding(
  padding: const EdgeInsets.fromLTRB(18.0, 2, 18, 2),
  child: Text(
    text,
    style: StyleText().textStyleUserDetailTitle,
  ),
);
