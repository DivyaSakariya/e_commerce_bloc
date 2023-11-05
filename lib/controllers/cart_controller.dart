import 'package:e_commerce_bloc/modals/api_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartController extends Cubit {
  CartController() : super(null);

  List<ProductModal> cartItems = <ProductModal>[];
  int totalAmt = 0;

  addToCart({required ProductModal productModal})
}
