import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hey_there_app/bloc/colors/ColorsBloc.dart';
import 'package:hey_there_app/bloc/colors/ColorsEvent.dart';
import 'package:hey_there_app/bloc/colors/ColorsState.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ColorsBloc get _colorsBloc => BlocProvider.of<ColorsBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        tooltip: 'Show history',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<ColorsBloc, ColorsState>(
      builder: (context, ColorsState state) {
        return GestureDetector(
            child: Container(
              color: state.color,
              child: Center(child: Center(child: Text("Hey there"))),
            ),
            onTap: _onAnywherePressed);
      },
    );
  }

  void _onAnywherePressed() {
    _colorsBloc.add(ChangedColorEvent());
  }

  void _onFloatingActionButtonPressed() {}
}
