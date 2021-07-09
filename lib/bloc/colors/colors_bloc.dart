import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hey_there_app/color_generator.dart';

import 'colors_event.dart';
import 'colors_state.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  static const String TEXT = 'Hey there';
  static const int MAX_HISTORY_LENGTH = 30;
  static const Color DEFAULT_COLOR = Colors.white;
  static const Color DEFAULT_TEXT_COLOR = Colors.black;

  final List<Color> _colorsHistory = [];
  Color _currentColor = DEFAULT_COLOR;

  ColorsBloc() : super(ColorsState('', [], DEFAULT_COLOR, [])) {
    this.add(ChangedColorEvent());
  }

  @override
  Stream<ColorsState> mapEventToState(ColorsEvent event) async* {
    switch (event.runtimeType) {
      case ChangedColorEvent:
        yield* _onChangedColor();
        break;
    }
  }

  Stream<ColorsState> _onChangedColor() async* {
    _colorsHistory.insert(0, _currentColor);
    if (_colorsHistory.length > MAX_HISTORY_LENGTH) {
      _colorsHistory.length = MAX_HISTORY_LENGTH;
    }
    _currentColor = ColorGenerator.generateRandomColor();
    yield ColorsState(TEXT, _colorsHistory, _currentColor, _generateColors());
  }

  List<Color> _generateColors() {
    return List.generate(
        TEXT.length, (index) => ColorGenerator.generateRandomColor());
  }
}
