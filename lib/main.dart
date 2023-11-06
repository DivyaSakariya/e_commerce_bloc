import 'package:e_commerce_bloc/controllers/home_controller.dart';
import 'package:e_commerce_bloc/helpers/api_helper.dart';
import 'package:e_commerce_bloc/routes/routes.dart';
import 'package:e_commerce_bloc/views/screens/cart_page.dart';
import 'package:e_commerce_bloc/views/screens/favourite_apge.dart';
import 'package:e_commerce_bloc/views/screens/home_page.dart';
import 'package:e_commerce_bloc/views/screens/product_detail_page.dart';
import 'package:e_commerce_bloc/views/screens/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiHelper.apiHelper.getData();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eCommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => HomeController(),
        child: HomePage(),
      ),
      initialRoute: MyRoutes.homePage,
      routes: {
        MyRoutes.productDetailPage: (context) => BlocProvider<HomeController>(
              create: (_) => HomeController(),
              child: const ProductDetailPage(),
            ),
        MyRoutes.favouritePage: (context) => BlocProvider<HomeController>(
              create: (_) => HomeController(),
              child: const FavouritePage(),
            ),
        MyRoutes.cartPage: (context) => BlocProvider<HomeController>(
              create: (_) => HomeController(),
              child: const CartPage(),
            ),
        MyRoutes.userInfoPage: (context) => BlocProvider<HomeController>(
              create: (_) => HomeController(),
              child: const UserInfoPage(),
            ),
      },
    );
  }
}
