import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hey_there_app/views/history_page.dart';
import 'package:hey_there_app/bloc/colors/colors_bloc.dart';
import 'package:hey_there_app/bloc/colors/colors_event.dart';
import 'package:hey_there_app/bloc/colors/colors_state.dart';

class MainPage extends StatefulWidget {
  static const ROUTE_NAME = '/';

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
        child: const Icon(Icons.history),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<ColorsBloc, ColorsState>(
      builder: (context, ColorsState state) {
        return GestureDetector(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    color: state.color,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          state.text.length,
                          (index) => Text(
                                state.text[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: state.textColors[index]),
                              )),
                    )),
                  ),
                )
              ],
            ),
            onTap: _onAnywherePressed);
      },
    );
  }

  void _onAnywherePressed() {
    _colorsBloc.add(ChangedColorEvent());
  }

  void _onFloatingActionButtonPressed() {
    Navigator.of(context).pushNamed(HistoryPage.ROUTE_NAME);
  }
}
