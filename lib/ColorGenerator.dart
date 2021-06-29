import 'dart:math';
import 'package:flutter/material.dart';

class ColorGenerator {
  static Color generateRandomColor() {
    Random random = Random();

    int randomChannelValue() {
      const int MAX_CHANNEL_VALUE = 256;
      return random.nextInt(MAX_CHANNEL_VALUE);
    }

    const double DEFAULT_OPACITY = 1.0;
    return Color.fromRGBO(randomChannelValue(), randomChannelValue(),
        randomChannelValue(), DEFAULT_OPACITY);
  }
}
