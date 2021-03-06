import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hey_there_app/views/history_page.dart';
import 'package:hey_there_app/views/main_page.dart';
import 'package:hey_there_app/bloc/colors/colors_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorsBloc>(
      create: (context) => ColorsBloc(),
      child: MaterialApp(
          title: 'Hey there',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: MainPage.ROUTE_NAME,
          routes: {
            MainPage.ROUTE_NAME: (context) => MainPage(),
            HistoryPage.ROUTE_NAME: (context) => HistoryPage()
          }),
    );
  }
}
