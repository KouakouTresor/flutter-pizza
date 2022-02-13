import 'package:flutter/cupertino.dart';
import 'package:my_app/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart extends ChangeNotifier {
  List<CartItem> _items = [];

  int totalItems(){return _items.length;}
  double totalPrice(){
    /* int index = _findCartItemIndex(pizza.id); */
    return 5;
  }
  CartItem getCartItem(int index){
    return _items[index];
  }

  void addProduct(Pizza pizza){
    int index = _findCartItemIndex(pizza.id);
    if(index == -1){
       _items.add(CartItem(pizza));
    } else {
      CartItem item = _items[index];
      item.quantity ++;
    }
notifyListeners();
  }

  void removeProduct(Pizza pizza){
    int index = _findCartItemIndex(pizza.id);
    if(index != -1){
           CartItem item = _items[index];

        if (--item.quantity == 0) {
       // Suppression
       _items.removeAt(index);
     }
         notifyListeners();
    }
  }

  int _findCartItemIndex(int id){
    return _items.indexWhere((element)=>element.pizza.id == id);
  }
}