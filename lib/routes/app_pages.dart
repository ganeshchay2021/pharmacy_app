import 'package:get/get.dart';
import 'package:pharmacy_app/admin/admin_login_view.dart';
import 'package:pharmacy_app/routes/app_routes.dart';
import 'package:pharmacy_app/admin/admin_dashboard_view.dart';
import 'package:pharmacy_app/view/botton_nav.dart';
import 'package:pharmacy_app/view/home_view.dart';
import 'package:pharmacy_app/view/login_view.dart';
import 'package:pharmacy_app/view/product_details_view.dart';
import 'package:pharmacy_app/view/sign_up_view.dart';

class AppPages {
  //app pages
  static final routes = [
    // //splash page
    //   GetPage(name: AppRoutes.splash, page: ()=> SplashView()),

    //home page
    GetPage(name: AppRoutes.home, page: () => HomeView()),

    //home page
    GetPage(name: AppRoutes.login, page: () => LoginView()),

    //product details page
    GetPage(name: AppRoutes.product, page: () => ProductDetailsView()),

    //signup page
    GetPage(name: AppRoutes.signUp, page: () => SignUpView()),

    //admin Login page
    GetPage(name: AppRoutes.adminLogin, page: () => AdminLoginView()),

     //admin dashboard page
    GetPage(name: AppRoutes.adminDashboard, page: () => AdminDashBoardView()),

    
     //botton Nav bar
    GetPage(name: AppRoutes.bottomNavBar, page: () => BottonNav()),
  ];
}
