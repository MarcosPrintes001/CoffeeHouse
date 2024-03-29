import 'package:coffee_house/components/coffee_tile.dart';
import 'package:coffee_house/models/coffee.dart';
import 'package:coffee_house/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  //pay buttom pressed
  payNow() {
    bool cart = Provider.of<CoffeeShop>(context, listen: false).cartEmpty();
    if (cart) {
      //não tem itens no carrinho
      return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: const Text(
            'NO ITEMS IN YOUR CART',
            textAlign: TextAlign.center,
          ),
          content: const Text("Add items to your cart before proceeding"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      //Há itens no carrinho
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: Row(
            children: const [
              Image(
                image: ResizeImage(
                  AssetImage(
                    ('assets/coffees/coffee-shop.png'),
                  ),
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text('Successfully'),
            ],
          ),
          content: const Text(
            'Your purchase was successful thank you for your preference',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      Provider.of<CoffeeShop>(context, listen: false).clearCart();
    }

    /*
            
      USAR PROVIDER DE PAGAMENTO

    */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading
              const Text(
                "Your Cart",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: AutofillHints.familyName,
                ),
              ),

              //lis of coffees
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    //get individual cart items
                    Coffee eachCoffee = value.userCart[index];

                    //return coffee tile
                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => removeFromCart(eachCoffee),
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
              ),

              //Pay Buttom
              GestureDetector(
                onTap: () => payNow(),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
