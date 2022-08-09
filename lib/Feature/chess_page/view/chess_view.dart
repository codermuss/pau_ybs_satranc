import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:pau_ybs_satranc/Feature/chess_page/model/chess_model.dart';
import 'package:pau_ybs_satranc/Feature/chess_page/view_model/chess_view_model.dart';
import 'package:pau_ybs_satranc/Product/Constants/string_constants.dart';
import 'package:provider/provider.dart';
import '../../../Core/widget/black_state.dart';
import '../../../Core/widget/bottom_characters.dart';
import '../../../Core/widget/custom_divider.dart';
import '../../../Core/widget/mid_screen.dart';
import '../../../Core/widget/top_characters.dart';
import '../../../Product/Style/text_styles.dart';

class ChessView extends StatefulWidget {
  const ChessView({Key? key}) : super(key: key);

  @override
  State<ChessView> createState() => _ChessViewState();
}

class _ChessViewState extends State<ChessView> {
  ChessBoardController controller = ChessBoardController();
  bool hareketSirasi = true;
  String? hareket1;
  String? hareket2;
  List<String> beyazHareketler = [];
  List<String> siyahHareketler = [];
  @override
  void initState() {
    super.initState();
    controller.addListener(() {});
  }

  void hareketSirasiDegistir() {
    hareketSirasi = !hareketSirasi;
  }

  @override
  Widget build(BuildContext context) {

     return ChangeNotifierProvider<ChessViewModel>(
      create: (BuildContext context) => ChessViewModel(),
      builder: (context, child) => StreamBuilder<ChessModel>(
          stream: Provider.of<ChessViewModel>(context,listen: false).getChessList(),
          builder: ( context,asyncSnapshot) {
            if(asyncSnapshot.hasError){
                return Center(child: Text("${StringConstants.errorMessage} ${asyncSnapshot.error}"));

            }else{
              if(!asyncSnapshot.hasData){
                return const Center( child: CircularProgressIndicator(),);
              }else{
                ChessModel? chessModel=asyncSnapshot.data;
                hareket1=chessModel?.fromTo?.split("-").first;
                hareket2=chessModel?.fromTo?.split("-").last;
                if (controller.makeMove(from: hareket1 ?? "",to: hareket2 ?? "")) {
                  if (hareketSirasi == false) {
                    beyazHareketler.add("${hareket1??''}->${hareket2?? ''}");
                  } else {
                    siyahHareketler.add("${hareket1??''}->${hareket2?? ''}");
                  }
                  hareketSirasiDegistir();
                } else {
                  hareket1='';
                  hareket2='';

                }

                return SafeArea(
                    child: Scaffold(
                      endDrawer: moveListDrawer(),
                      appBar: AppBar(
                        centerTitle: true,
                        title: const Text(StringConstants.appTitle),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: !hareketSirasi
                                      ? Text(
                                    StringConstants.blackToMove,
                                    style: StyleText().textStyle18ColorBlack,
                                  ): Text(
                                    "${StringConstants.lastMove} ${hareket1 ?? ''} -> ${hareket2 ?? ''}",
                                    style: StyleText().textStyle18ColorBlack,
                                  )),
                            ),
                            const CustomDivider(),
                            const TopCharachters(),
                            MidScreen(controller: controller),
                            const BottomCharacters(),
                            const CustomDivider(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: hareketSirasi
                                    ? Text(
                                  StringConstants.whiteToMove,
                                  style: StyleText().textStyle18ColorBlack,
                                )
                                    : Text(
                                  "${StringConstants.lastMove} ${hareket1 ?? ''} -> ${hareket2 ?? ''}",
                                  style: StyleText().textStyle18ColorBlack,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));


              }

            }


          }),
    );
  }

  Drawer moveListDrawer() {
    return Drawer(
                      child: ListView(
                        // Important: Remove any padding from the ListView.
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(
                            height: 65,
                            child: DrawerHeader(
                              decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                              ),
                              child: Text(
                                StringConstants.moves,
                                style: StyleText().textStyleUserDetailTitle,
                              ),
                            ),
                          ),
                          Text(
                            StringConstants.whiteMoves,
                            style: StyleText().textStyleUserDetailTitle,
                          ),
                          Text(
                            beyazHareketler.toString(),
                            style: StyleText().textStyle18ColorBlack,
                          ),
                          const Divider(
                            color: Colors.blueGrey,
                            height: 12,
                          ),
                          Text(
                            StringConstants.blackMoves,
                            style: StyleText().textStyleUserDetailTitle,
                          ),
                          Text(
                            siyahHareketler.toString(),
                            style: StyleText().textStyle18ColorBlack,
                          ),
                        ],
                      ),
                    );
  }
}





