import 'package:flutter/cupertino.dart';
import 'package:my_app/models/pizza.dart';
class CartItem {
  final Pizza pizza;
  int quantity;
  CartItem(this.pizza, [this.quantity = 1]);

}

class Cart extends ChangeNotifier{
  List<CartItem> _items = [];
  int totalItems(){ return _items.length;}

  double totalPrice (){
    double total = 0;
    for(CartItem item in _items){
      total += (item.pizza.total  * item.quantity);
    }
    return total;
  }
  int totalQuantity (){
    int total = 0;
    for(CartItem item in _items){
      total += item.quantity;
    }
    return total;
  }
  CartItem getCartItem(int index){
    return _items[index];
  }

  void addProduct(Pizza pizza){
    int index = _findCartItemIndex(pizza);
    if(index == -1){
      _items.add(CartItem(pizza));
    } else {
      CartItem item = _items[index];
      item.quantity++;
    }
    notifyListeners();
  }

  void removeProduct(Pizza pizza){
    int index = _findCartItemIndex(pizza);
    if(index != -1) {
      CartItem item = _items[index];
      if(-- item.quantity == 0) {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  int _findCartItemIndex(pizza){
    return _items.indexWhere((element) => element.pizza == pizza);
  }

  changeQuantity(CartItem item, int quantity) {
    item.quantity = quantity;
    notifyListeners();
  }
}