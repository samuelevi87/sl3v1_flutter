import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../models/user_model.dart';
import '../providers/product_provider.dart';
import '../widgets/product_tile.dart';
import 'exercicio_14_pag_04.dart';
import 'exercicio_14_pag_05.dart';

class AdminScreen extends StatefulWidget {
  final User admin;

  AdminScreen({required this.admin});

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  void _editProduct(int index) async {
    final editedProduct = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProductScreen(
            product: Provider.of<ProductProvider>(context, listen: false)
                .products[index]),
      ),
    );

    if (editedProduct != null && editedProduct is Product) {
      Provider.of<ProductProvider>(context, listen: false)
          .editProduct(index, editedProduct);
    }
  }

  void _deleteProduct(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Excluir Produto'),
        content: Text(
            'Deseja realmente excluir o produto "${Provider.of<ProductProvider>(context).products[index].name}"?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Provider.of<ProductProvider>(context, listen: false)
                  .deleteProduct(index);
              Navigator.pop(context);
            },
            child: Text('Excluir'),
          ),
        ],
      ),
    );
  }

  void _navigateToAddProductScreen() async {
    final newProduct = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductScreen()),
    );

    if (newProduct != null && newProduct is Product) {
      Provider.of<ProductProvider>(context, listen: false)
          .addProduct(newProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel de Administração'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          return ListView.builder(
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) {
              return ProductTile(
                product: productProvider.products[index],
                onEdit: () {
                  _editProduct(index);
                },
                onDelete: () {
                  _deleteProduct(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddProductScreen,
        child: Icon(Icons.add),
      ),
    );
  }
}
