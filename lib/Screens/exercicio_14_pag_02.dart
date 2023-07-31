import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sl3v1_flutter/models/product_model.dart';

import '../models/user_model.dart';
import '../providers/product_provider.dart';
import 'exercicio_14_pag_06.dart';

class ProductsListScreen extends StatelessWidget {
  final User user;

  ProductsListScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.imageUrl,
              height: 50,
              width: 50,),
            title: Text(product.name),
            subtitle: Text(product.description),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                addToCart(product);
              },
            ),
            onTap: () {
              // Navega para a tela de detalhes do produto
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Método para adicionar produto ao carrinho
  void addToCart(Product product) {
    // Implemente a lógica para adicionar o produto ao carrinho do usuário
    // Exemplo: widget.user.addToCart(product);
  }
}
