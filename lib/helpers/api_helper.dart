import 'package:dio/dio.dart';
import 'package:e_commerce_bloc/modals/product_modal.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String api = "https://dummyjson.com/products?limit=100";

  Dio dio = Dio();

  List<ProductModal> allProducts = [];

  Future<List<ProductModal>> getData() async {
    Response response = await dio.get(api);

    if (response.statusCode == 200) {
      List allData = response.data['products'];

      allProducts = allData.map((e) => ProductModal.fromMap(data: e)).toList();
    }
    return allProducts;
  }
}
