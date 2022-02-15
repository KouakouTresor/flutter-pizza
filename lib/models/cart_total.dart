
import 'package:flutter/cupertino.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/ui/share/pizzeria_style.dart';
import 'package:provider/provider.dart';
import "package:intl/intl.dart";

class CartTotal extends StatelessWidget {
  const CartTotal({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
      var format = NumberFormat("###.00 €");
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
                        Text(
                          '20% ',
                          style: PizzeriaStyle.itemPriceTextStyle,
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
  }
}