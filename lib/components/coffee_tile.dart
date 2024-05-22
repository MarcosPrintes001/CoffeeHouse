// ignore_for_file: must_be_immutable

import 'package:coffee_house/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  void Function()? onPressed;
  final Widget icon;
  CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: Text(
                    coffee.description,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            Text("${coffee.price}0 R\$ "),
          ],
        ),
        leading: SizedBox(
          width: 100, // Defina a largura desejada
          height: 100, // Defina a altura desejada
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              coffee.imgPath,
            ),
          ),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
