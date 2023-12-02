import 'package:e_commerce_bloc/helpers/api_helper.dart';
import 'package:e_commerce_bloc/modals/product_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductController extends Cubit<List<ProductModal>> {
  GetProductController() : super([]);

  Future<List<ProductModal>> getProducts() async {
    state.addAll(await ApiHelper.apiHelper.getData());

    return state;
  }
}
