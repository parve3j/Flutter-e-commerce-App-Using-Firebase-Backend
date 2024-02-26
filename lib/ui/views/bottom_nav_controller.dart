import 'package:e_com/const/app_colors.dart';
import 'package:e_com/ui/views/nav_pages/cart.dart';
import 'package:e_com/ui/views/nav_pages/favourite_page.dart';
import 'package:e_com/ui/views/nav_pages/home_page.dart';
import 'package:e_com/ui/views/nav_pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
class BottomNavController extends StatelessWidget {
  BottomNavController({super.key});
  
  RxInt _currentIndex=0.obs;
  final _pages=[
    HomePage(),
    FavouritePage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar:  SalomonBottomBar(
        selectedItemColor: AppColors.mandarinColor,
        currentIndex: _currentIndex.value,
        onTap: (val){
          _currentIndex.value=val;
        },
        items: [
          bottomBarItem(Icons.home_filled, "Home"),
          bottomBarItem(Icons.favorite_outline, "Favourite"),
          bottomBarItem(Icons.shopping_bag_outlined, "Cart"),
          bottomBarItem(Icons.person, "Person"),
        ],
      ),
      body: _pages[_currentIndex.value],
    ));
  }
}
SalomonBottomBarItem bottomBarItem(icon, title)=>
    SalomonBottomBarItem(icon: Icon(icon), title: Text(title));
