import 'package:drink_beer/models/beersModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drink_beer/objects/beer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {

    Beer beer = ModalRoute.of(context).settings.arguments;
    Opinion op = context.watch<BeerModel>().getOp(beer.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(beer.name),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 100),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Mesto'),
                      Text('az predelam model')
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Voltage'),
                      Text('${beer.voltage}%')
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Rating',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card( 
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: RatingBar.builder(
                        initialRating: op.rating,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        onRatingUpdate: null,
                      )
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Komentar',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    String text = op.comment;
                    dynamic tmp = await Navigator.pushNamed(context, '/edit', arguments: text);
                    setState(() {
                      op.comment = tmp;
                    });
                  }
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: 100
              ),
              child: SizedBox(
                height: 700,
                width: 500,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(op.comment),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}