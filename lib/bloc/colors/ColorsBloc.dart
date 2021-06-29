import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hey_there_app/ColorGenerator.dart';

import 'ColorsEvent.dart';
import 'ColorsState.dart';

class ColorsBloc extends Bloc<ColorsEvent, ColorsState> {
  static const Color DEFAULT_COLOR = Colors.white;

  final List<Color> _colorsHistory = [];
  Color _currentColor = DEFAULT_COLOR;

  ColorsBloc() : super(ColorsState([], DEFAULT_COLOR));

  @override
  Stream<ColorsState> mapEventToState(ColorsEvent event) async* {
    switch (event.runtimeType) {
      case ChangedColorEvent:
        yield* _onChangedColor();
        break;
    }
  }

  Stream<ColorsState> _onChangedColor() async* {
    _colorsHistory.add(_currentColor);
    _currentColor = ColorGenerator.generateRandomColor();
    yield ColorsState(_colorsHistory, _currentColor);
  }
}
