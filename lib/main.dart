import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

import 'Product/Style/text_styles.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[400]
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ChessBoardController controller = ChessBoardController();
  final FirebaseFirestore _database=FirebaseFirestore.instance;
  bool hareketSirasi=true;
  String? hareket1;
  String? hareket2;
  List<String> beyazHareketler=[];
   List<String> siyahHareketler=[];
  @override
  void initState() {
    super.initState();
    controller.addListener(() {});
  }

  void hareketSirasiDegistir(){
    hareketSirasi=!hareketSirasi;
    print(hareketSirasi);
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference koleksiyonReferansi=_database.collection("/game");
    final DocumentReference dokumanReferans=koleksiyonReferansi.doc("hareketler");




    return    StreamBuilder<DocumentSnapshot> (
        stream: dokumanReferans.snapshots() ,
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> asyncSnapshot){
    print("StreamBuilder calisti");
    var documentSnapshot=asyncSnapshot.data;
    var mapData=documentSnapshot?.data();
    String? data= mapData?.toString();
    print(data?.split(":"));
    List<String>? data2=data?.split(":");
    print(data2);
    print(data2?[1]);
    print( data2?[1].replaceAll("}", ""));
    String? data3=data2?[1].replaceAll("}", "");
    String? data4=data3?.replaceAll(" ", "");
    print(data4);
    List<String>? hareketVerileri=data4?.split("-");
    print(hareketVerileri?[0]);
    print(hareketVerileri?[1]);


    //controller.makeMove(from: "f2", to: "f4");
    if(controller.makeMove(from: hareketVerileri?[0]??"", to: hareketVerileri?[1]??""))  {
    hareket1=hareketVerileri?[0];
    hareket2=hareketVerileri?[1];
   // hareketSirasi?beyazHareketler?.add("${hareket1??''}->${hareket2??''}"):siyahHareketler?.add("${hareket1??''}->${hareket2??''}");
    if(hareketSirasi==false){
      beyazHareketler.add("${hareketVerileri?[0]??''}->${hareketVerileri?[1]??''}");
    }else{
      siyahHareketler.add("${hareketVerileri?[0]??''}->${hareketVerileri?[1]??''}");
    }
    print(beyazHareketler);
    print(beyazHareketler);
    hareketSirasiDegistir();
    }else{
    print("Hareket Gerceklestirilemedi");
    }

    return SafeArea(
      child: Scaffold(
        
        endDrawer: Drawer(

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
                  child: Text('Hamleler',style: StyleText().textStyleUserDetailTitle,),
              ),
               ),

              Text("Beyaz Hareketler",style: StyleText().textStyleUserDetailTitle,),

              Text(beyazHareketler.toString(),style: StyleText().textStyle18ColorBlack,),
              const Divider(
                color: Colors.blueGrey,
                height: 12,
              ),
              Text("Siyah Hareketler",style: StyleText().textStyleUserDetailTitle,),
              Text(siyahHareketler.toString(),style: StyleText().textStyle18ColorBlack,),
            ],
          ),
        ),
              appBar: AppBar(
              centerTitle: true,
              title: const Text("Paü YBS Satranç"),

            ),
            body:
           Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align( alignment: Alignment.center, child:!hareketSirasi? Text("Sıra Siyahta",style: StyleText().textStyle18ColorBlack,):Text("Son Hareket: ${hareket1??''} -> ${hareket2??''}",style: StyleText().textStyle18ColorBlack,)),
                      ),
                      const Divider(
                        thickness: 10,
                        color: Colors.blueGrey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          chess_text("a"),
                          chess_text("b"),
                          chess_text("c"),
                          chess_text("d"),
                          chess_text("e"),
                          chess_text("f"),
                          chess_text("g"),
                          chess_text("h"),

                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 400,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
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
                                onMove: () {

                                },
                                arrows: const [
                                  //  BoardArrow(from: "b2", to: "b4", color: Colors.red.withOpacity(0.9))
                                ],
                              ),
                            ),


                          SizedBox(
                            height: 400,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
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
                      ),
                      Row(
                        children:  [
                          chess_text("a"),
                          chess_text("b"),
                          chess_text("c"),
                          chess_text("d"),
                          chess_text("e"),
                          chess_text("f"),
                          chess_text("g"),
                          chess_text("h"),
                        ],
                      ),
                      const Divider(
                        thickness: 10,
                        color: Colors.blueGrey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align( alignment: Alignment.center, child:hareketSirasi? Text("Sıra Beyazda",style: StyleText().textStyle18ColorBlack,):Text("Son Hareket: ${hareket1??''} -> ${hareket2??''}",style: StyleText().textStyle18ColorBlack,),),
                      )
                    ],
                  ),
                ),
          ),
    );
      }
    );}


  }

  Text chess_number(String text) => Text(text,style: StyleText().textStyleUserDetailTitle,);

  Padding chess_text(String text) => Padding(
    padding: const EdgeInsets.fromLTRB(18.0,2,18,2),
    child: Text(text,style: StyleText().textStyleUserDetailTitle,),
  );

