import 'package:colorfy/feature/model/game.dart';
import 'package:flutter/material.dart';

class ColorGamePage extends StatefulWidget {
  Game game;
  ColorGamePage(this.game, {super.key});

  @override
  State<StatefulWidget> createState() => ColorGamePageState();
}

class ColorGamePageState extends State<ColorGamePage> {
  Game? game;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game = widget.game;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECECEC),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lives: ${widget.game.lives}"),
                      const SizedBox(
                        width: 200,
                      ),
                      Text("Rounds: ${widget.game.rounds} "),
                    ],
                  ),
                ),
                const Positioned(
                  top: 100,
                  child: Text("What is this color?"),
                ),
                Positioned(
                  top: 150,
                  child: Text("${widget.game.correctAnswer}"),
                ),
                Positioned.fill(
                  top: 200,
                  child: Container(
                    alignment: Alignment.center,
                    child: ListView.builder(
                      itemCount: widget.game.getCurrentCount,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (game!.isOver) {
                              return;
                            }
                            var clickedAnswer = widget
                                .game.modes![widget.game.currentMode]!.keys
                                .toList()[index];
                            if (game!.checkForAnswer(clickedAnswer)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Wrong answer")));
                              setState(() {
                                widget.game.lives--;
                              });
                            } else {
                              setState(() {
                                widget.game.rounds--;
                              });
                            }
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            color: Color(
                              game!.modes![widget.game.currentMode]!.values
                                  .toList()[index],
                            ),
                          ),
                        );
                      }),
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
