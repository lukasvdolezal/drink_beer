import 'package:drink_beer/models/menuModel.dart';
import 'package:drink_beer/models/beersModel.dart';
import 'package:flutter/material.dart';
import 'package:drink_beer/objects/beer.dart';
import 'package:provider/provider.dart';

class ChooseBeer extends StatefulWidget {
  @override
  _ChooseBeerState createState() => _ChooseBeerState();
}

class _ChooseBeerState extends State<ChooseBeer> {
  List<Beer> menu = [
    Beer(id: 1, name: 'Plzen', voltage: 4.7),
    Beer(id: 2, name: 'Kozel', voltage: 3.6),
    Beer(id: 3, name: 'Branik', voltage: 4.0),
    Beer(id: 4, name: 'Punk IPA', voltage: 5.2),
    Beer(id: 5, name: 'Staropramen', voltage: 2.6),
    Beer(id: 6, name: 'Starobrno', voltage: 3.8),
    Beer(id: 7, name: 'Holba', voltage: 4.0),
    Beer(id: 8, name: 'Carlsberg', voltage: 3.5),
    Beer(id: 9, name: 'Kacov', voltage: 3.0),
    Beer(id: 10, name: 'Vinohrady', voltage: 5.6),
  ];

  @override
  Widget build(BuildContext context) {
    int count = Provider.of<MenuModel>(context, listen: false).getlength();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Choose a beer'),
        ),
        body: ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            Beer tmp = Provider.of<MenuModel>(context, listen: false).getBeerbyId(index);
            return Card(
                child: ListTile(
              onTap: () {
                var beersTmp = context.read<BeerModel>();
                if(!beersTmp.contains(tmp)){
                  beersTmp.add(tmp);
                  Navigator.pop(context);
                }else{
                  showAlertDialog(context);
                }
              },
              leading: Avatar(name: tmp.name),
              title: Text('${tmp.name} (${tmp.voltage}%)'),
            ));
          },
        ));
  }

  showAlertDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      title: Text('Oops.'),
      content: Text('To uz si ochutnal synku'),
      actions: [
        FlatButton(
          child: Text('Achjo.'),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context){
        return alert;
      },
    );
  }

}
