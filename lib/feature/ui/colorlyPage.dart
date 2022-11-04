import 'package:colorfy/feature/model/game.dart';
import 'package:colorfy/feature/ui/colorGamePage.dart';
import 'package:flutter/material.dart';

class ColorfyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ColorfyPageState();
}

class ColorfyPageState extends State<ColorfyPage> {
  late Game game;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(
                    top: 100,
                    bottom: 0,
                    child: Text("Choose a mode you’d like to play:")),
                Positioned.fill(
                  top: 200,
                  child: Container(
                    alignment: Alignment.center,
                    child: ListView(
                      addAutomaticKeepAlives: true,
                      addSemanticIndexes: true,
                      children: [
                        GestureDetector(
                          onTap: () {
                            game = Game.start(selectedMode: "RGBA");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ColorGamePage(game),
                                ));
                          },
                          child: const Text(
                            "RGBA",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            game = Game.start(selectedMode: "HEX CODE");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ColorGamePage(game),
                                ));
                          },
                          child: const Text(
                            "HEX CODE",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            game = Game.start(selectedMode: "HSL");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ColorGamePage(game),
                                ));
                          },
                          child: const Text(
                            "HSL",
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
