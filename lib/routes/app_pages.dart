import 'package:get/get.dart';
import 'package:pharmacy_app/routes/app_routes.dart';
import 'package:pharmacy_app/view/home_view.dart';
import 'package:pharmacy_app/view/product_details_view.dart';
import 'package:pharmacy_app/view/splash_view.dart';

class AppPages {
  //app pages
  static final routes=[
    //splash page
      GetPage(name: AppRoutes.splash, page: ()=> SplashView()),

      //home page
      GetPage(name: AppRoutes.home, page: ()=> HomeView()),

      //product details page
      GetPage(name: AppRoutes.product, page: ()=> ProductDetailsView()),
  ];
}