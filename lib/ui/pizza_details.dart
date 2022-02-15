import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/models/option_item.dart';
import 'package:my_app/models/pizza.dart';
import 'package:my_app/ui/share/appbar_widget.dart';
import 'package:my_app/ui/share/button_navigation.dart';
import 'package:my_app/ui/share/buy_button_widget.dart';
import 'package:my_app/ui/share/pizzeria_style.dart';
import 'package:my_app/ui/share/total_widget.dart';
class PizzaDetails extends StatefulWidget {
  final Pizza _pizza;

  const PizzaDetails(this._pizza, {Key? key}) : super(key: key);

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(widget._pizza.title),
      body: ListView(
        padding: const EdgeInsets.all(4.0),
        children: [
          Text(widget._pizza.title, style: PizzeriaStyle.pageTitleTextStyle),
          Image.network(widget._pizza.image, height: 180),
           Text("Recette", style: PizzeriaStyle.headerTextStyle),
          Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 12.0),
              child: Text(widget._pizza.garniture)
          ),
           Text("Pate et taille", style: PizzeriaStyle.headerTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _buildPatesDropDown()),
              Expanded(child: _buildTaillesDropDown())
            ],
          ),
           Text("Sauces", style: PizzeriaStyle.headerTextStyle),
          _buildSaucesDropDown(),
          TotalWidget(widget._pizza.total),
          BuyButtonWidget(widget._pizza)
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(2),
    );
  }
_buildPatesDropDown(){
    return DropdownButton<OptionItem>(
        items: _buildDropDownItem(Pizza.pates),
        isExpanded: true,
        value: Pizza.pates[widget._pizza.pate],
        onChanged: (item){
          setState(() {widget._pizza.pate = item!.value;});
        }
    );
  }

  _buildTaillesDropDown(){
    return DropdownButton<OptionItem>(
        items: _buildDropDownItem(Pizza.tailles),
        isExpanded: true,
        value: Pizza.tailles[widget._pizza.taille],
        onChanged: (item){
          setState(() {widget._pizza.taille = item!.value;});
        }
    );
  }

  _buildSaucesDropDown(){
    return DropdownButton<OptionItem>(
        items: _buildDropDownItem(Pizza.sauces),
        isExpanded: true,
        value: Pizza.sauces[widget._pizza.sauce],
        onChanged: (item){
          setState(() {widget._pizza.sauce = item!.value;});
        }
    );
  }

  _buildDropDownItem(List<OptionItem> list){
    return Iterable.generate(
        list.length,
            (i)=>DropdownMenuItem<OptionItem>(value: list[i], child: Text(list[i].name))
    ).toList();
  }
}