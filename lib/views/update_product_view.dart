import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProdutView extends StatefulWidget {
  const UpdateProdutView({super.key});
  static String id = 'Update Product Page';

  @override
  State<UpdateProdutView> createState() => _UpdateProdutViewState();
}

class _UpdateProdutViewState extends State<UpdateProdutView> {
  String? pruductName, description, imageUrl;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  onChanged: (value) {
                    pruductName = value;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (value) {
                    description = value;
                  },
                  hintText: 'description',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (value) {
                    price = value;
                  },
                  hintText: 'Price',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (value) {
                    imageUrl = value;
                  },
                  hintText: 'image url',
                ),
                const SizedBox(height: 50),
                CustomButton(
                  text: 'Update Product',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await updateProduct(product);
                    } on Exception catch (e) {
                      log(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: pruductName == null ? product.title : pruductName!,
        price: price == null ? product.price.toString() : price!,
        desc: description == null ? product.description : description!,
        image: imageUrl == null ? product.image : imageUrl!,
        category: product.category);
  }
}
