import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      name: 'Mouse Gamer',
      description: 'Mouse Gamer RGB com alta precisão',
      imageUrl:
          'https://img.banggood.com/images/oaupload/banggood/images/03/28/04869ac8-01c1-4f0b-b15d-87c373715c88.gif',
      price: 129.99,
    ),
    Product(
      name: 'Teclado Mecânico',
      description: 'Teclado mecânico para jogos com iluminação LED',
      imageUrl:
          'https://th.bing.com/th/id/R.37e290f3f6b77e4e1c1e2bf0ca5d5e3d?rik=NkmJX4eOX9Kx9A&pid=ImgRaw&r=0',
      price: 219.90,
    ),
    Product(
      name: 'Headset Gamer',
      description: 'Headset Gamer com cancelamento de ruído',
      imageUrl: 'https://media2.giphy.com/media/sfYCq2IHlSX7y/giphy.gif',
      price: 179.50,
    ),
    Product(
      name: 'Mousepad Gamer',
      description: 'Mousepad Gamer com base de borracha antiderrapante',
      imageUrl:
          'https://images10.newegg.com/BizIntell/item/26/998/26-998-255/c0.gif',
      price: 39.99,
    ),
  ];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void editProduct(int index, Product product) {
    _products[index] = product;
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }
}
