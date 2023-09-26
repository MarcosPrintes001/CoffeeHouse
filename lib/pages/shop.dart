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
          const AlertDialog(title: Text("Seccessfully added to cart")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              //Heading message
              const Text(
                "How Wold you like your Coffee?",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(
                height: 20,
              ),

              //List of coffees
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    //get individual coffee
                    Coffee eachCoffee = value.coffeeShop[index];

                    //return de tilefor this coffee
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => addToCart(eachCoffee),
                      icon: const Icon(
                        Icons.add,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
