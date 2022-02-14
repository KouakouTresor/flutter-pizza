import 'package:flutter/cupertino.dart';
import 'package:my_app/ui/share/pizzeria_style.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import "package:intl/intl.dart";

class _CartList extends StatelessWidget {
  var format = NumberFormat("###.00");
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      child: Consumer<Cart>(
        builder: (context, cart, child){
          final double totalPrice = cart.totalPrice();
          String totalTTC = format.format(totalPrice);
          String totalHT = format.format(totalPrice*0.8);// TVA 20%

          if(totalPrice == 0){
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
  }
}