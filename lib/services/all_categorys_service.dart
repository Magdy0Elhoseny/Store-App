import 'dart:async';
import 'package:store_app/helper/api.dart';

class AllCategorysService {
  Future<List<dynamic>> getAllCategorys() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
