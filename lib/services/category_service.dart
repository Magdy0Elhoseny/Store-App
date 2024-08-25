import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategorysService {
  Future<List<ProductModel>> getCategorysProducts(
      {required String categryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categryName');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
