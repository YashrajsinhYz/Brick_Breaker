import 'dart:async';

import 'package:brick_breaker/components/break_bricks.dart';
import 'package:brick_breaker/constants/config.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayArea extends RectangleComponent
    with HasGameReference<BreakBricks> {
  PlayArea() : super(paint: Paint()..color = bgColor,children: [RectangleHitbox()]);

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    size = Vector2(game.width, game.height);
  }
}
