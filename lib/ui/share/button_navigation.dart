import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/cart.dart';
import 'package:my_app/ui/share/badge_widget.dart';
import 'package:provider/src/provider.dart';
import 'package:badges/badges.dart';

import '../panier.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int indexSelected;
  const BottomNavigationBarWidget(this.indexSelected, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    var _totalItems = cart.totalItems();

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indexSelected,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_outlined), label: "Commande"),
          BottomNavigationBarItem(
              icon: _totalItems == 0
                  ? Icon(Icons.add_shopping_cart_outlined)
                  : BadgeWidget(
                      child: Icon(Icons.shopping_cart),
                      value: _totalItems,
                      top: 0,
                      right: 0,
                    ),
              label: "Panier"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
        onTap: (index) {
          String page = '/';
          switch (index) {
            case 2:
            page = '/panier';
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Panier(),
                  ));
              break;
          }
          Navigator.pushNamed(context, page);
        });
  }
}
