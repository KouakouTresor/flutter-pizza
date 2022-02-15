import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/ui/pizza_details.dart';
import 'package:my_app/ui/share/button_navigation.dart';
import 'package:my_app/ui/share/pizzeria_style.dart';
import 'package:provider/provider.dart';
import "package:intl/intl.dart";
class Panier extends StatelessWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Mon Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: _CartList(),
            ),
          ),
          // section des prix
          _CartTotal(),
          // button Validation en rouge
          Container(
            height: 30,
            child: ElevatedButton(
              child: Text(
                " VALIDER LE PANIER ",
                style: PizzeriaStyle.baseTextStyle,
              ),
              onPressed: (){ print('Valider');},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                fixedSize: MaterialStateProperty.all<Size>(const Size(380, 30)),
              ),
            ),
            margin: EdgeInsets.all(2.0),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(2),
    );
}
class _CartList extends StatelessWidget {
  var format = NumberFormat("###.00 €");

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();

    return ListView.builder(
        itemCount: cart.totalItems(),
        itemExtent: 120,
        itemBuilder: (context, index) {
          var cartItem = cart.getCartItem(index);
          if (cartItem.quantity> 0) {
            return Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PizzaDetails(cartItem.pizza),
                        ));
                  },
                  child:
                  Image.network(
                    cartItem.pizza.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 130,
                    //width: 145,
                    padding: const EdgeInsets.only(left: 5.0, top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            cartItem.pizza.title,
                            style: PizzeriaStyle.regularTextStyle,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  //padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    '${cartItem.pizza.total} €',
                                    style: PizzeriaStyle.itemPriceTextStyle,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  //padding: const EdgeInsets.only(left: 60.0, bottom: 20.0),
                                  child: SpinBox( min: 1,
                                    max: 100,
                                    value: cartItem.quantity.toDouble(),
                                    onChanged: (value) => cart.changeQuantity(cartItem, value.toInt())
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            'Sous-total: ${cartItem.pizza.total *
                                cartItem.quantity}',
                            style: PizzeriaStyle.priceSubTotalTextStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }else {
            return Container();
          }
        }
    );
  }
}

class _CartTotal extends StatelessWidget{
  var format = NumberFormat("###.00 €");
  @override
  Widget build(BuildContext context){

    return Container(
      padding: EdgeInsets.all(6.0),
      child: Consumer<Cart>(
        builder: (context, cart, child){
          final double _total = cart.totalPrice();
          String totalTTC = format.format(_total);
          String totalHT = format.format(_total*0.8);// TVA 20%

          if(_total == 0){
            return Center(
              child: Text('Aucun produit',
                style: PizzeriaStyle.priceTotalTextStyle,),
            );
          } else {
            return Container(
              height: 100,
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(3),
                  2: FlexColumnWidth(2),
                },
                children: [
                  TableRow(children: [
                    Column(children:[
                      Text('')
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            child: Text(
                              'TOTAL HT',
                              style: PizzeriaStyle.itemPriceTextStyle,
                            ),
                          ),
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            totalHT,
                            style: PizzeriaStyle.itemPriceTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ]),
                  TableRow(children: [
                    Column(children:[
                      Text('')
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            child: Text(
                              'TVA',
                              style: PizzeriaStyle.itemPriceTextStyle,
                            ),
                          ),
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            '20% ',
                            style: PizzeriaStyle.itemPriceTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ]),
                  TableRow(children: [
                    Column(children:[
                      Text('')
                    ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            child: Text(
                              'TOTAL TTC',
                              style: PizzeriaStyle.subPriceTextStyle,
                            ),
                          ),
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            totalTTC,
                            style: PizzeriaStyle.subPriceTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            );
          }
        },
      ),
    );
  }}