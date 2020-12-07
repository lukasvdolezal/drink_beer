import 'package:flutter/material.dart';

//This beer class. The best class.

class Beer {
  int id;
  String name;
  double voltage;

  Beer({this.id, this.name, this.voltage});
}

class Avatar extends StatelessWidget {
  final String name;

  Avatar({this.name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[400],
      child: Text(
        '${name[0].toUpperCase()}',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
