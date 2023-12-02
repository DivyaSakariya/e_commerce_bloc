import 'package:e_commerce_bloc/modals/product_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartController extends Cubit<List<Map>> {
  CartController(super.initialState);

  List<Map> addCart(Map data) {
    (state.contains(data)) ? state.remove(data) : state.add(data);

    return state;
  }
}
