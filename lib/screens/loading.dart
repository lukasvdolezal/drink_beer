import 'package:flutter/material.dart';

//This is loading screen to make the app looks like it actually does something

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 150),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'DRINK BEER',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'loading...',
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/beer.png',
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  void waitASecond() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    waitASecond();
  }
}
