import 'package:coffee_house/components/bottom_nav_bar.dart';
import 'package:coffee_house/pages/cart.dart';
import 'package:coffee_house/pages/shop.dart';
import 'package:coffee_house/utils/constans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  //navigate bottom bar
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    //shop page
    ShopPage(),
    //car page
    CartPage(),
  ];

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),

      body: _pages[_selectedIndex],
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: signUserOut,
      //       icon: const Icon(Icons.logout),
      //     ),
      //   ],
      // ),
      // body: Center(
      //   child: Text("Logged in as: ${user.email!}"),
      // ),
    );
  }
}
