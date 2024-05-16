import 'package:coffee_house/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale Lis
  final List<Coffee> _shop = [
    //black coffee
    Coffee(
      name: "Latte",
      price: 8.00,
      description: "Espresso e leite vaporizado. Sabor do café mais suave. 380ml",
      imgPath: "assets/coffee/cafe-quente/latte.png",
    ),

     Coffee(
      name: "Americano",
      price: 6.10,
      description: "Espresso duplo suavizado com água. 380ml",
      imgPath: "assets/coffee/cafe-quente/americano.png",
    ),

  ];

  //user cart
  final List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  // Clear cart
  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }

  //verify if te cart are empty
  cartEmpty() {
    if (_userCart.isEmpty) {
      return true;
    }
    return false;
  }
}
