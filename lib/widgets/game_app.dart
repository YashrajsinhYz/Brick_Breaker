import 'package:brick_breaker/components/break_bricks.dart';
import 'package:brick_breaker/constants/config.dart';
import 'package:brick_breaker/widgets/overlay_screen.dart';
import 'package:brick_breaker/widgets/score_card.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late final BreakBricks game;

  @override
  void initState() {
    super.initState();
    game = BreakBricks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.pressStart2pTextTheme().apply(
          bodyColor: batBallColor,
          displayColor: batBallColor,
        ),
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffa9d6e5),
                Color(0xfff2e8cf),
              ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  ScoreCard(score: game.score),
                  Expanded(
                    child: FittedBox(
                      child: SizedBox(
                        width: gameWidth,
                        height: gameHeight,
                        child: GameWidget(
                          game: game,
                          overlayBuilderMap: {
                            PlayState.welcome.name: (context, game) =>
                                const Center(
                                  child: OverlayScreen(
                                      title: "TAP TO PLAY",
                                      subtitle: "Use arrow keys or swipe"),
                                ),
                            PlayState.gameOver.name: (context, game) =>
                                const Center(
                                  child: OverlayScreen(
                                      title: "G A M E   O V E R",
                                      subtitle: "Tap to Play Again"),
                                ),
                            PlayState.won.name: (context, game) => const Center(
                                  child: OverlayScreen(
                                      title: "Y O U   W O N ! ! !",
                                      subtitle: "Tap to Play Again"),
                                ),
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
