import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/ui/pizza_details.dart';
import 'package:my_app/ui/share/pizzeria_style.dart';
import 'package:my_app/ui/share/total_widget.dart';
import 'package:provider/provider.dart';
import "package:intl/intl.dart";

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
        body: ListView.builder(
            itemCount: widget._cart.totalItems(),
            itemBuilder: (context, index) {
              var cartItem = widget._cart.getCartItem(index);
              if (cartItem.quantity > 0) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PizzaDetails(cartItem.pizza, widget._cart),
                            ));
                      },
                      child: Image.network(
                        'http://10.60.28.79:8888/flutter_pizzas${cartItem.pizza.image}',
                        height: 100,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      height: 110,
                      //width: 145,
                      padding: const EdgeInsets.only(left: 5.0, top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              cartItem.pizza.title,
                              style: PizzeriaStyle.regularTextStyle,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.0),
                                child: Text(
                                  '${cartItem.pizza.total} €',
                                  style: PizzeriaStyle.itemPriceTextStyle,
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(left: 60.0, bottom: 20.0),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Sous-total: ${cartItem.pizza.total * cartItem.quantity}',
                              style: PizzeriaStyle.priceSubTotalTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            }));
  }

  Widget _buildItem(BuildContext context, CartItem carteItem) {
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

class _CartList extends StatelessWidget {
  var format = NumberFormat("###.00 €");

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    return ListView.builder(
        itemCount: cart.totalItems(),
        itemBuilder: (context, index) {
          var cartItem = cart.getCartItem(index);
          if (cartItem.quantity > 0) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PizzaDetails(cartItem.pizza, cart),
                        ));
                  },
                  child: Image.network(
                    'http://10.60.28.79:8888/flutter_pizzas${cartItem.pizza.image}',
                    height: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  height: 110,
                  //width: 145,
                  padding: const EdgeInsets.only(left: 5.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          cartItem.pizza.title,
                          style: PizzeriaStyle.regularTextStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              '${cartItem.pizza.total} €',
                              style: PizzeriaStyle.itemPriceTextStyle,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 60.0, bottom: 20.0),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'Sous-total: ${cartItem.pizza.total * cartItem.quantity}',
                          style: PizzeriaStyle.priceSubTotalTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
