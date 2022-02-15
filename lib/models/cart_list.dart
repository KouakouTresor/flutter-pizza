import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/ui/pizza_details.dart';
import 'package:my_app/ui/share/pizzeria_style.dart';
import 'package:provider/src/provider.dart';

class Cart_list extends StatefulWidget {
  const Cart_list( {Key? key}) : super(key: key);

  @override
  _Cart_listState createState() => _Cart_listState();
}

class _Cart_listState extends State<Cart_list> {
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
                              PizzaDetails(cartItem.pizza),
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
