import 'package:flutter/material.dart';
import 'package:drink_beer/objects/beer.dart';

class MenuModel{

  List<Beer> menu = [
    Beer(id: 1, name:'Plzen', voltage: 4.7),
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

  Beer getBeerbyId(int id){
    return menu[id];
  }

  int getlength(){
    return menu.length;
  }

}