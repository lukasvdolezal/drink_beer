import 'package:drink_beer/objects/boozehound.dart';
import 'package:drink_beer/models/beersModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//This is widget that shows basic profile info above the list of drank beers
//It contains "Add" button for adding a beer to profile
//The add button navigates user to screen where he can choose beer that he had recently

class Header extends StatefulWidget {
  /*const Header({
    Key key,
  }) : super(key: key);*/

  Header();

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Boozehound boozehound;

  @override
  Widget build(BuildContext context) {
    boozehound = Provider.of<BeerModel>(context).getBoozeH();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/batman.png'),
            ),
            Text(boozehound.name),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Vypito piv:'),
                        Text(boozehound.beerCount.toString())
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Avg Voltage:'),
                        Text(boozehound.avgVoltage.toStringAsFixed(1))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                width: 300,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chooseBeer');
                  },
                  child: Text('Add beer'),
                  color: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }
}
