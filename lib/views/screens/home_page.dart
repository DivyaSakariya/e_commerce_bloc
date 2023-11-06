import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_bloc/controllers/home_controller.dart';
import 'package:e_commerce_bloc/helpers/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  CarouselController buttonCarouselController = CarouselController();
  final List<String> carouselImage = [
    "https://as2.ftcdn.net/v2/jpg/02/84/58/71/1000_F_284587125_cFebCDzJNcLeJ7IC4Z56PjpAAPQSFhHi.jpg",
    "https://media.istockphoto.com/id/1428709516/photo/shopping-online-woman-hand-online-shopping-on-laptop-computer-with-virtual-graphic-icon.webp?b=1&s=170667a&w=0&k=20&c=ZhlW6F6fSu42EG13PO0hkgV0L-MqHipJm1hT0yaRl9U=",
    "https://neilpatel.com/wp-content/uploads/2015/04/image12.jpg"
  ];

  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyRoutes.cartPage);
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyRoutes.favouritePage);
              },
              icon: const Text(
                "♡",
                style: TextStyle(fontSize: 20),
              )),
        ],
        title: const Text(
          "HOMEPAGE",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeController, Map>(builder: (context, state) {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(),
              items: carouselImage
                  .map((item) => Container(
                        child: Center(
                            child: Image.network(item,
                                fit: BoxFit.cover, width: 1000)),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
                child: Text(
              "Category",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 13,
              child: (controller.filter.isEmpty)
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: ApiHelper.apiHelper.allProducts!.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              MyRoutes.productDetailPage,
                              arguments: index);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 140,
                              width: 170,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(ApiHelper.apiHelper
                                        .allProducts![index]['thumbnail']),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Text(ApiHelper.apiHelper.allProducts![index]
                                ['category']),
                            Text(
                                "${ApiHelper.apiHelper.allProducts![index]['price']}"),
                            // Text("${product[index]!.brand}"),
                          ],
                        ),
                      ),
                    )
                  : GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: List.generate(controller.filterProduct.length,
                          (index) {
                        if (controller.filterProduct[index]!.category ==
                            controller.filter) {
                          return Column(
                            children: [
                              Container(
                                height: 140,
                                width: 170,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(controller
                                          .filterProduct[index].thumbnail),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Text(controller.filterProduct[index].category),
                              Text(
                                  "${ApiHelper.apiHelper.allProducts![index]['price']}"),
                              // Text("${product[index]!.brand}"),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),
                    ),
            ),
          ],
        );
      }),
    );
  }
}
