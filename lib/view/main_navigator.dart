import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/screens/account/account_screen.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/screens/cart/cart_screen.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/screens/favorites/favorites_screen.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/screens/home/home_screen.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/screens/search/search_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../viewmodel/cart_viewmodel.dart';

class MainNavigator extends ConsumerStatefulWidget {
  const MainNavigator({super.key});

  @override
  ConsumerState<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends ConsumerState<MainNavigator> {
  static const _pages = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    SearchScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cartItemCount = ref.watch(cartItemListProvider).length;
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        items: <SalomonBottomBarItem>[
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            selectedColor: Colors.deepPurple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite),
            title: const Text('Favorite'),
            selectedColor: Colors.deepPurple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Search'),
            selectedColor: Colors.deepPurple,
          ),
          SalomonBottomBarItem(
            icon: Badge.count(
              isLabelVisible: cartItemCount >= 1,
              count: cartItemCount,
              textStyle: const TextStyle(fontFamily: 'Roboto'),
              child: const Icon(Icons.shopping_cart),
            ),
            title: const Text('Cart'),
            selectedColor: Colors.deepPurple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Account'),
            selectedColor: Colors.deepPurple,
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
