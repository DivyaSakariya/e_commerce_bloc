import 'package:e_commerce_bloc/modals/api_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController extends Cubit {
  HomeController() : super({});

  bool isGrid = false;
  bool isDark = false;
  String filter = "";

  List<ProductModal> filterProduct = [];

  final List<String> imagePaths = [];


  List<ProductModal> addCart = [];

  List<ProductModal> favourite = [];
}
