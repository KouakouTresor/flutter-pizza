import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/cart.dart';

import '../panier.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const AppBarWidget(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
      actions: [
        IconButton(
        onPressed: (){
          Navigator.push(
            context, MaterialPageRoute(
            builder: (context)=>Panier(),
          )
          );
        },
          icon: Icon(Icons.shopping_cart),
      )
      ],
    );
  }
}
