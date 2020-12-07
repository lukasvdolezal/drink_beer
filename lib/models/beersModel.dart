import 'package:drink_beer/objects/boozehound.dart';
import 'package:flutter/material.dart';
import 'package:drink_beer/objects/beer.dart';

class BeerModel extends ChangeNotifier{

  Boozehound bh =
    Boozehound(name: 'Pijan Vypitov', beerCount: 0, avgVoltage: 0);

  Map<String, Beer> myBeers = {
    //'Plzen' : Beer(id:1, name:'Plzen', voltage: 4.7),
  };

  List<Beer> toView = [
    //Beer(id:1, name:'Plzen', voltage: 4.7),
  ];

  Map<String, Opinion> myOps = {
    //'Plzen' : Opinion(id: 1, comment: 'Tohle je dobry pivo', rating: 4)
  };

  Beer getBeerbyId(int id){
    return myBeers.values.elementAt(id);
  }

  int getlength(){
    return myBeers.length;
  }

  Map<String, Beer> getBeers(){
    return myBeers;
  }

  List<Beer> getList(){
    return toView;
  }

  Opinion getOp(String name){
    return myOps[name];
  }

  void updateBoozeH(double input){
    bh.avgVoltage = ((bh.avgVoltage*bh.beerCount)+input)/(++bh.beerCount);
  }

  void updateList(Beer beer){
    toView.add(beer);
    toView.sort((a,b)=>a.name.compareTo(b.name));
  }

  void add(Beer beer){
    myBeers[beer.name] = beer;
    myOps[beer.name] = Opinion(id: beer.id, rating: 0, comment: '');
    updateList(beer);
    updateBoozeH(beer.voltage);
    notifyListeners();
  }

  bool contains(Beer beer){
    return myBeers[beer.name]!=null ? true : false;
  }

  Boozehound getBoozeH(){
    return bh;
  }
}

class Opinion{
  int id;
  String comment;
  double rating;

  Opinion({this.id, this.comment, this.rating});
} 