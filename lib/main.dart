
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ui/panier.dart';
import 'package:my_app/ui/pizza_list.dart';
import 'package:my_app/ui/share/appbar_widget.dart';
import 'package:provider/provider.dart';
import './models/pizza_data.dart';
import './models/menu.dart';
import 'models/cart.dart';
import 'models/pizza.dart';

void main() {
 runApp(
   ChangeNotifierProvider(
     create: (context) => Cart(),
     child: MyApp(),
   ),
 );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzeria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Notre pizzeria'),
   /*    routes: {
        '/profil':(context)=>Profil(),
        '/panier':(context)=>Panier(),
      } */
    );
  }
}

class  MyHomePage extends StatelessWidget {
  String title;
  Cart _cart;

  MyHomePage({Key? key, required this.title}) :
        _cart = Cart(),
        super(key: key);


  final _menus = [
    Menu(1, 'Entrées', 'entree.png', Colors.lightGreen),
    Menu(2, 'Pizza', 'pizza.png', Colors.redAccent),
    Menu(3, 'Desserts', 'dessert.png', Colors.brown),
    Menu(4, 'Boissons', 'boisson.png', Colors.lightGreen)
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar:AppBarWidget(title, _cart),
      body: Center(
        child: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              switch (_menus[index].type){
                case 2: //Pizza
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> PizzaList(_cart)),
                );
                break;
              }
            },
            child: _buildRow(_menus[index])
          ),
          itemExtent: 180,
        )
        )
      );
  }

}

_buildRow(Menu menu) {
  return Container(
    height: 180,
    decoration: BoxDecoration(
      color: menu.color,
      borderRadius: BorderRadius.all(Radius.circular(20.0))
    ),
    
    margin: EdgeInsets.all(4.0), 
    child: Column(
      children: <Widget>[
      Expanded(
        child:Image.asset(
          'assets/images/menus/${menu.image}',
          fit: BoxFit.fitWidth,
          ), 
          ),
         Container(
            height: 50,
            child: Center(
              child: Text(
                menu.title,
                style: TextStyle(
                  fontWeight:  FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 28,
                )
              ),
            ),
          ) ,    
    ],
    ),
    
  );
  
}



