import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hey_there_app/bloc/colors/colors_bloc.dart';
import 'package:hey_there_app/bloc/colors/colors_event.dart';
import 'package:hey_there_app/bloc/colors/colors_state.dart';

void main() {
  blocTest('emits state after color changed',
      build: () => ColorsBloc(),
      act: (ColorsBloc bloc) {
        bloc.add(ChangedColorEvent());
      },
      expect: () => [isA<ColorsState>()]);

  blocTest('emits state with last color in history after color changed',
      build: () => ColorsBloc(),
      act: (ColorsBloc bloc) {
        bloc.add(ChangedColorEvent());
      },
      verify: (ColorsBloc bloc) {
        assert(bloc.state.colorsHistory.length == 1 &&
            bloc.state.colorsHistory[0] == Colors.white);
      });
}
