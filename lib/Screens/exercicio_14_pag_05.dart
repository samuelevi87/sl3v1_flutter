import 'package:flutter/material.dart';

import '../models/product_model.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;
  late TextEditingController _priceController; // Novo TextEditingController

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _imageUrlController = TextEditingController();
    _priceController =
        TextEditingController(); // Inicializa o TextEditingController para o preço do produto
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    _priceController
        .dispose(); // Não esqueça de descartar o TextEditingController
    super.dispose();
  }

  void _addProduct() {
    String name = _nameController.text.trim();
    String description = _descriptionController.text.trim();
    String imageUrl = _imageUrlController.text.trim();
    double price = double.tryParse(_priceController.text.trim()) ??
        0.0; // Obtém o preço como um double

    if (name.isNotEmpty && description.isNotEmpty && imageUrl.isNotEmpty) {
      Product newProduct = Product(
        name: name,
        description: description,
        imageUrl: imageUrl,
        price: price, // Passa o preço para o construtor do produto
      );

      Navigator.pop(context, newProduct);
    } else {
      // Mostrar um aviso ao usuário caso algum campo esteja vazio
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Campos obrigatórios'),
          content: Text('Por favor, preencha todos os campos.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome do Produto'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descrição do Produto'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'URL da Imagem'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _priceController,
              // Novo TextField para o preço do produto
              keyboardType: TextInputType.number,
              // Teclado numérico
              decoration: InputDecoration(labelText: 'Preço'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addProduct,
              child: Text('Adicionar Produto'),
            ),
          ],
        ),
      ),
    );
  }
}
