import 'package:flutter/material.dart';

import '../../Product/Constants/string_constants.dart';
import '../../Product/Style/text_styles.dart';

class BlackState extends StatelessWidget {
  const BlackState({
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
    print("blackto move haraketsirasi degeri: $hareketSirasi");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.center,
          child: !hareketSirasi
              ? Text(
            StringConstants.blackToMove,
            style: StyleText().textStyle18ColorBlack,
          )
              : Text(
            "Son Hareket: ${hareket1 ?? ''} -> ${hareket2 ?? ''}",
            style: StyleText().textStyle18ColorBlack,
          )),
    );
  }
}
