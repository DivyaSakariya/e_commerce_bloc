import 'package:e_commerce_bloc/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../routes/routes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();

    Size s = MediaQuery.of(context).size;
    int ind = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.favouritePage);
            },
            icon: const Icon(
              Icons.favorite_outlined,
            ),
          ),
        ],
        title: const Text(
          "CART_PAGE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocBuilder<HomeController, Map>(builder: (context, state) {
          return Column(
            children: [
              Expanded(
                flex: 15,
                child: ListView.builder(
                  itemCount: controller.addCart.length,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      SizedBox(height: s.height * 0.01),
                      // const Spacer(),
                      Row(
                        children: [
                          // product Image
                          CircleAvatar(
                            foregroundImage: NetworkImage(
                                controller.addCart[index].thumbnail),
                          ),
                          SizedBox(
                            width: s.width * 0.05,
                          ),
                          // Product Title / Product Price
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // product Title
                              Text(controller.addCart[index].title),
                              // Product Price
                              Text("\$ ${controller.addCart[index].price}"),
                            ],
                          ),
                          const Spacer(),
                          // Product Quantities
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (controller.addCart[index].qty < 1) {
                                    controller.addCart
                                        .remove(controller.addCart[index]);
                                  } else {
                                    controller.addCart[index].qty--;
                                  }
                                },
                                icon: const Icon(Icons.remove_rounded),
                              ),
                              Text("${controller.addCart[index].qty}"),
                              IconButton(
                                onPressed: () {
                                  controller.addCart[index].qty++;
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyRoutes.userInfoPage);
                  },
                  child: const Text("Buy"),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
