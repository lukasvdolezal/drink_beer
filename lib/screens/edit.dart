import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {

  String output = '';
  final myController = TextEditingController();

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String old = ModalRoute.of(context).settings.arguments;
    myController.text = old;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Uprav komentar'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed:(){
              output = myController.text;
              Navigator.pop(context, output);
            }
          )
        ],
      ),
      body: TextField(
        controller: myController,
      ),
    );
  }
}