import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/ui/share/total_widget.dart';

class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart, {Key? key}) : super(key: key);

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
          child: ListView.builder(
              itemCount: widget._cart.totalItems(),
              itemBuilder: (context, index) {
                return _buildItem(widget._cart.getCartItem(index));
              }
          )
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




  Widget _buildItem(CartItem carteItem){
    return Row(
      children: [
        Text(carteItem.pizza.image),
        Column(
          children: [
            Text(carteItem.pizza.title),
            TotalWidget(carteItem.pizza.price),
            TotalWidget(carteItem.pizza.total),
          ],
        )
      ],
    );
  }

}








