import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ui/share/pizzeria_style.dart';

class TotalWidget extends StatelessWidget {
  final double total;
  const TotalWidget(this.total, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = NumberFormart("###.00 €");
    String totalAfficher = format.format(total);

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Row(
        children : [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12.0),
              child: Text(
                'TOTAL',
                style: PizzeriaStyle.priceTotalTextStyle,
                textAlign: TextAlign.end,
              )
            )
          ),
          Expanded(
            child: Text(
              totalAfficher,
              style: PizzeriaStyle.priceTotalTextStyle,
              textAlign: TextAlign.end,
            )
          )
        ]
      ) ,
    );
  }
}
