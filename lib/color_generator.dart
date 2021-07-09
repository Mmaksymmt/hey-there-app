import 'dart:math';
import 'package:flutter/material.dart';

class ColorGenerator {
  static const int MAX_CHANNEL_VALUE = 255;
  static final Random random = Random();

  static Color generateRandomColor() {
    double opacity = _randomChannelValue() / MAX_CHANNEL_VALUE;
    return Color.fromRGBO(_randomChannelValue(), _randomChannelValue(),
        _randomChannelValue(), opacity);
  }

  static int _randomChannelValue() {
    return random.nextInt(MAX_CHANNEL_VALUE + 1);
  }
}
