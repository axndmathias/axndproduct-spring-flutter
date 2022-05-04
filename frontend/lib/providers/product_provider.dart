import 'package:flutter/cupertino.dart';
import 'package:frontend/common/constants.dart';

import '../models/Product.dart';
import '../repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  Product? productToEdit;
  int pagesNumber = 0;

  final ProductRepository _productRepository = ProductRepository();

  getProducts(int page, String? searchValue, SortTypes? sortType,
      GetTypes getTypes) async {
    Map<String, dynamic> returnedData =
        await _productRepository.getProductsList(page, searchValue, sortType);

    List<Product> pageProducts = await returnedData["products list"];
    pagesNumber = returnedData["pages number"];

    if (getTypes == GetTypes.PAGING) {
      products = products + pageProducts;
    } else {
      products = pageProducts;
    }
    notifyListeners();
  }

  addProduct(Product product) async {
    Product saveProduct = await _productRepository.addProduct(product);
    products.add(saveProduct);
  }

  editdProduct(Product product) async {
    Product editedProduct = await _productRepository.editProduct(product);
    products[products.indexOf(product)] = editedProduct;
  }

  deleteProduct(Product product) async {
    await _productRepository.deleteProduct(product);
    products.remove(product);
    notifyListeners();
  }
}
