import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/ui/pizza_details.dart';
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
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: widget._cart.totalItems(),
                  itemBuilder: (context, index) {
                  return 
                    _buildItem(context, widget._cart.getCartItem(index));
                  })),
        ]));
  }

  Widget _buildItem(BuildContext context,CartItem carteItem) {
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



  _buildRow(BuildContext context, CartItem carteItem) {
  return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10.0), top: Radius.circular(2.0))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PizzaDetails(carteItem.pizza, widget._cart),
                ),
              );
            },
        )
      ]));
}
}


