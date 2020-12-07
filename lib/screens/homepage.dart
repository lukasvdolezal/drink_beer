import 'package:flutter/material.dart';
import 'package:drink_beer/objects/header.dart';
import 'package:drink_beer/models/beersModel.dart';
import 'package:drink_beer/objects/beer.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int count;
  Beer tmp;

  @override
  Widget build(BuildContext context) {
    count = Provider.of<BeerModel>(context, listen: false).getlength();
    context.watch<BeerModel>();
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('My profile'),
      ),
      body: SafeArea(
        child: BeerListView(count: count,),
      ),
    );
  }
}

class BeerListView extends StatelessWidget {
  const BeerListView({
    Key key,
    @required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    context.watch<BeerModel>().getBeers();
    List<Beer> tmplist = Provider.of<BeerModel>(context, listen: false).getList();
    return ListView.builder(
      itemCount: count + 1,
      itemBuilder: (context, index) {
        if (index < 1)
          return Header();
        var tmp = tmplist[index - 1];
        return Card(
          child: ListTile(
            leading: Avatar(name: tmp.name),
            title: Text(
              '${tmp.name} (${tmp.voltage}%)'
            ),
            trailing: IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: tmp,
                );
              },
            ),
          ),
        );
      },
    );
  }
}