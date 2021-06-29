import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hey_there_app/bloc/colors/ColorsBloc.dart';
import 'package:hey_there_app/bloc/colors/ColorsState.dart';

class HistoryPage extends StatefulWidget {
  static const ROUTE_NAME = "/history";

  @override
  State<StatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyWidget(),
      appBar: AppBar(
        title: Text("Colors history"),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return BlocBuilder<ColorsBloc, ColorsState>(
      builder: (context, ColorsState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text("Current color",
                    style: Theme.of(context).textTheme.subtitle1)),
            _buildColorTile(state.color),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text("History",
                    style: Theme.of(context).textTheme.subtitle1)),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: state.colorsHistory.length,
                    itemBuilder: (context, index) =>
                        _buildColorTile(state.colorsHistory[index])))
          ],
        );
      },
    );
  }

  Widget _buildColorTile(Color color) {
    return ListTile(
      leading: Container(color: color, width: 100),
      title: Text(color.toString()),
    );
  }
}
