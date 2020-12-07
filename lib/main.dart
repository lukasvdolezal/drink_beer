import 'package:drink_beer/models/beersModel.dart';
import 'package:drink_beer/models/menuModel.dart';
import 'package:flutter/material.dart';
import 'package:drink_beer/screens/loading.dart';
import 'package:drink_beer/screens/homepage.dart';
import 'package:drink_beer/screens/chooseBeer.dart';
import 'package:drink_beer/screens/detail.dart';
import 'package:drink_beer/screens/edit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<BeerModel>(
        create: (context) => BeerModel(),
      ),
      Provider(create: (context) => MenuModel()),
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/chooseBeer': (context) => ChooseBeer(),
        '/detail': (context) => Detail(),
        '/edit': (context) => Edit(),
      },
    ),
  ));
}
