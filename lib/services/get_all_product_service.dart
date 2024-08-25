import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    // Fetch the data from the API.
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productsList = [];
    for (var item in data) {
      try {
        ProductModel product = ProductModel.fromJson(item);
        productsList.add(product);
      } catch (ex) {
        Exception(
            'there is a problem with statuscode so Failed to load data**********${ex}*************');
      }
    }

    return productsList;
  }
}
/* 
Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }

    return productsList;
  }
 */

/*
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    // Fetch the data from the API.
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> productsList = [];
    for (var item in data) {
      try {
        ProductModel product = ProductModel.fromJson(item);
        productsList.add(product);
      } catch (ex) {
        Exception(
            'there is a problem with statuscode so Failed to load data**********${ex}*************');
      }
    }

    return productsList;
  }
}
*/