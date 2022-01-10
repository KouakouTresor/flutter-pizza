import 'package:my_app/models/pizza.dart';

class CartItem {
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart{
  List<CartItem> _items = [];

  int totalItems(){
    return _items.length;
  }

  void addProduct(Pizza pizza){
    int index = findCartItemIndex(pizza.id);
    if(index == -1){
      return _items.add(CartItem(pizza));
    } else {
      CartItem item = _items[index];
      item.quantity ++;
    }

  }

  void removeProduct(Pizza pizza){
    int index = findCartItemIndex(pizza.id);
    if(index != -1){
      _items.removeAt(index);
    }
  }

  int findCartItemIndex(int id){
    return _items.indexWhere((element)=>element.pizza.id == id);
  }
}