
import 'package:flutter/material.dart';

import '../../Product/Style/text_styles.dart';

class WhiteState extends StatelessWidget {
  const WhiteState({
    Key? key,
    required this.hareketSirasi,
    required this.hareket1,
    required this.hareket2,
  }) : super(key: key);

  final bool hareketSirasi;
  final String? hareket1;
  final String? hareket2;

  @override
  Widget build(BuildContext context) {
    print("white to move haraketsirasi degeri: $hareketSirasi");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: hareketSirasi
            ? Text(
          "Sıra Beyazda",
          style: StyleText().textStyle18ColorBlack,
        )
            : Text(
          "Son Hareket: ${hareket1 ?? ''} -> ${hareket2 ?? ''}",
          style: StyleText().textStyle18ColorBlack,
        ),
      ),
    );
  }
}

