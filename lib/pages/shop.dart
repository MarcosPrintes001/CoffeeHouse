import 'package:coffee_house/components/coffee_tile.dart';
import 'package:coffee_house/models/coffee.dart';
import 'package:coffee_house/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    //add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    //notify user
    showDialog(
      context: context,
      builder: (context) =>
          const AlertDialog(title: Text("Adicionado ao carrinho")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) {
        final coffeeList = value.coffeeShop;
        return SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // Heading message
              const Text(
                "Como gostaria do seu café hoje?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              // List of coffees    
              Expanded(
                child: ListView.builder(
                  itemCount: coffeeList.length +
                      (coffeeList.length ~/ 2), // Adjust for headers
                  itemBuilder: (context, index) {
                    
                    if (index % 3 == 0) {
                      // Return header
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Text(
                              getHeaderForIndex(index),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Return coffee item
                      final coffeeIndex = index - ((index + 1) ~/ 3);
                      Coffee eachCoffee = coffeeList[coffeeIndex];
                      return CoffeeTile(
                        coffee: eachCoffee,
                        onPressed: () => addToCart(eachCoffee),
                        icon: const Icon(
                          Icons.add_shopping_cart,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to determine the header based on index
  String getHeaderForIndex(int index) {
    if (index ~/ 3 == 0) {
      return "Cafes quentes";
    } else if (index ~/ 3 == 1) {
      return "Cafes gelados";
    } else if (index ~/ 3 == 2) {
      return "Veganos";
    } else if (index ~/ 3 == 3) {
      return "Milk Shakes";
    } else {
      return "Pães";
    }
  }
}
