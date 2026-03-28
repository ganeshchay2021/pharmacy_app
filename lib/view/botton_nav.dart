import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/controller/product_controller.dart';
import 'package:pharmacy_app/utils/constants.dart';
import 'package:pharmacy_app/view/home_view.dart';
import 'package:pharmacy_app/view/order_view.dart';
import 'package:pharmacy_app/view/profile_view.dart';
import 'package:pharmacy_app/view/wallet_view.dart';

class BottonNav extends StatefulWidget {
  const BottonNav({super.key});

  @override
  State<BottonNav> createState() => _BottonNavState();
}

class _BottonNavState extends State<BottonNav> {

  //CurvedNavigationBar key declare
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  //product contoller object create
  ProductController productController = Get.find<ProductController>();


//list of Pages
  final List<Widget> pages = [
    HomeView(),
    OrderView(),
    WalletView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[productController.page.value]),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 60,
        index: 0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.shopping_bag, size: 30, color: Colors.white),
          Icon(Icons.wallet, size: 30, color: Colors.white),
          Icon(Icons.person_2_sharp, size: 30, color: Colors.white),
        ],
        color: Colors.black54,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Constants.backgrondColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          productController.page.value = index;
        },
      ),
    );
  }
}
