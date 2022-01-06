import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/option_item.dart';
import 'package:my_app/models/pizza.dart';
import 'package:my_app/ui/share/buy_button_widget.dart';
import 'package:my_app/ui/share/pizzeria_style.dart';

class PizzaDetails extends StatefulWidget {
  final Pizza _pizza;

  PizzaDetails(this._pizza, { Key? key }) : super(key: key);

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._pizza.title)
      ),
      body: ListView(
          padding: EdgeInsets.all(4.0),
          children: [
            Text('Pizza ${widget._pizza.title}',
                style: PizzeriaStyle.pageTitleTextStyle,
            ),
            Image.asset('assets/images/pizzas/${widget._pizza.image}',
            height: 180,
            ),
            Text('Recette',
              style: PizzeriaStyle.headerTextStyle,
            ),
            Padding(
              padding:EdgeInsets.only(top: 8.0, bottom: 12.0),
              child: Text(widget._pizza.garniture,
              ),
              ),
              Text('Pâte et taille sélectionées',
                style: PizzeriaStyle.headerTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:[
                Expanded(child: _buildDropDownPates()),
                Expanded(child: _buildDropDownTailles()),
              ],
              ),
              Text(
                  'Sauce sélectionées',
                style: PizzeriaStyle.headerTextStyle
              ),
            _buildDropDownSauces(),
              /*Text('Les sauces'),
               Text('${widget._pizza.prince} €'),
              */
            TotalWidget(widget._pizza.total),
              BuyButtonWidget(),
           /* ,
            BuyButtonWidget(widget._pizza, widget._cart)*/
          ]
      )
    );
  }

  _buildDropDownPates(){
    return DropdownButton<OptionItem>(
      isExpanded: true,
      value: Pizza.pates[widget._pizza.pate],
      items: _buildDropDownItem(Pizza.pates),
      onChanged: (item){
        setState((){
          widget._pizza.pate = item!.value;
        });
      },
    );
  }


  _buildDropDownItem(List<OptionItem>list){
    return Iterable.generate(
      list.length,
        (i)=> DropdownMenuItem<OptionItem>(
          value: list[i],
          child: Text(list[i].name),
        ),
    ).toList();
  }


  _buildDropDownTailles(List<OptionItem>list){
    return Iterable.generate(
      list.length,
          (i)=> DropdownMenuItem<OptionItem>(
        value: list[i],
        child: Text(list[i].name),
      ),
    ).toList();
  }

  _buildDropDownSauces(List<OptionItem>list){
    return Iterable.generate(
      list.length,
          (i)=> DropdownMenuItem<OptionItem>(
        value: list[i],
        child: Text(list[i].name),
      ),
    ).toList();
  }


  TotalWidget(){

  }
}

 _buildBuyButton() {
   return(
     Row(
       mainAxisAlignment: MainAxisAlignment.end,
       children: [
         ElevatedButton(
           style: ButtonStyle(
               backgroundColor:
               MaterialStateProperty.all<Color>(Colors.red.shade800)),
           child: Row(
             children: [
               Icon(Icons.shopping_cart),
               SizedBox(width: 5),
               Text("Commander"),
             ],
             ),
             onPressed: (){
               print('Commander une pizza');
             },
           ),
       ],
     )
   );
}
