import 'package:coffee_house/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  //coffee for sale Lis
  final List<Coffee> _shop = [
    
    //hot coffee
    Coffee(
      name: "LATTE",
      price: 8.00,
      description:
          "Espresso e leite vaporizado. Sabor do café mais suave. 380ml",
      imgPath: "assets/coffee/cafe-quente/latte.png",
    ),
    Coffee(
      name: "AMERICANO",
      price: 6.10,
      description: "Espresso duplo suavizado com água. 380ml",
      imgPath: "assets/coffee/cafe-quente/americano.png",
    ),

    //cold coffee
    Coffee(
      name: "DULCE DI LATTE",
      price: 12.00,
      description:
          "Bebida gelada à base de café, leite integral e doce de leite argentino. 380ml",
      imgPath: "assets/coffee/cafe-gelado/dulce-di-latte.jpg",
    ),
    Coffee(
      name: "MOCCA",
      price: 14.00,
      description: "Espresso, leite e ganache de chocolate. 380ml",
      imgPath: "assets/coffee/cafe-gelado/mocha.png",
    ),

    //vegan drinks
    Coffee(
      name: "CHOCOMANGO",
      price: 16.00,
      description:
          "Bebida com leite de aveia, ovomaltine em pó, cacau em pó, chantilly vegetal e suco de manga. 380ml",
      imgPath: "assets/coffee/bebidas-veganas/chocomango.jpg",
    ),
    Coffee(
      name: "LATTE-AVEIA",
      price: 12.00,
      description:
          "Espresso e leite vaporizado. Sabor do café mais suave. 380ml",
      imgPath: "assets/coffee/bebidas-veganas/latte-aveia.png",
    ),

    //milk shakes
    Coffee(
      name: "COFFEE SHAKE",
      price: 18.00,
      description:
          "Shake de café espresso com sorvete, finalizado com chantilly, calda de caramelo e chocolate. 380ml",
      imgPath: "assets/coffee/milk-shakes/coffee-shake-shake.jpg",
    ),
    Coffee(
      name: "BLUEBERRY SHAKE",
      price: 16.00,
      description:
          "Shake de blueberry com sorvete, finalizado com chantilly, blueberry e pó de blueberry. 460ml",
      imgPath: "assets/coffee/milk-shakes/blueberry-shake-shake.png",
    ),

    //breads
    Coffee(
      name: "CROISSANT CHOCO AMÊNDOA",
      price: 9.00,
      description:
          "Croissant com creme frangipane e creme de avelã, finalizado com amêndoas laminadas.",
      imgPath: "assets/coffee/paes/croissant-choco-amendoa.png",
    ),
    Coffee(
      name: "CROISSANT TRADICIONAL",
      price: 6.00,
      description: "Massa folhada à base de manteiga francesa.",
      imgPath: "assets/coffee/paes/croissant-tradicional.png",
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
