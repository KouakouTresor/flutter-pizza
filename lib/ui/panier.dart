import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/Cart.dart';

class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart,{Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children : [
                Text('Pizza 1'),
                Text('Pizza 2'),
                Text('Pizza 3'),
              ],
            ),
          ),
          Row(
            children:[
              Text('Total'),
              Text('30€'),
            ],
          ),
          Container(
            child: ElevatedButton(
              child: Text('Valider'),
              onPressed: (){
                print('Valider');
              },
            )
          )
        ]
      )
    );
  }
}

Widget _buildItem(CartItem carteItem){
  return Row(
    children: [
      Text('Image'),
      Column(
        children: [
          Text(carteItem.pizza.title),
          Text('Prix'),
          Text('Sous-total'),
        ],
      )
    ],
  );
}