import 'package:e_commerce_bloc/controllers/cart_controller.dart';
import 'package:e_commerce_bloc/helpers/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/routes.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "FAVOURITE_PRODUCTS",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child:
            BlocBuilder<CartController, List<Map>>(builder: (context, state) {
          return ListView.builder(
            itemCount: ApiHelper.apiHelper.allProducts.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    MyRoutes.productDetailPage,
                    arguments: index,
                  );
                },
                leading: CircleAvatar(
                  foregroundImage: NetworkImage(
                    ApiHelper.apiHelper.allProducts[index].thumbnail,
                  ),
                ),
                title: Text(
                  ApiHelper.apiHelper.allProducts[index].title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                trailing: Text(
                  "\$ ${ApiHelper.apiHelper.allProducts[index].price}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
