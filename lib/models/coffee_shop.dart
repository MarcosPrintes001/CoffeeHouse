import 'package:coffee_house/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale Lis
  final List<Coffee> _shop = [
    //black coffee
    Coffee(
      name: "Long Black",
      price: "2,00",
      imgPath: "assets/coffees/coffee.png",
    ),

    //expresso
    Coffee(
      name: "Expresso",
      price: "3,00",
      imgPath: "assets/coffees/espresso.png",
    ),

    //matchiato
    Coffee(
      name: "Matchiato",
      price: "5,00",
      imgPath: "assets/coffees/matchiato.png",
    ),

    //coffee pye
    Coffee(
      name: "Coffee Pye",
      price: "10,00",
      imgPath: "assets/coffees/coffee_pye.png",
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
