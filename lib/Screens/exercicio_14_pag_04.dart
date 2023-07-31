import 'package:flutter/material.dart';

import '../models/product_model.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;

  EditProductScreen({required this.product});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;
  late TextEditingController _priceController; // Novo TextEditingController

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController =
        TextEditingController(text: widget.product.description);
    _imageUrlController = TextEditingController(text: widget.product.imageUrl);
    _priceController = TextEditingController(
        text: widget.product.price
            .toString()); // Inicializa o TextEditingController com o preço do produto
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

  void _saveChanges() {
    String newName = _nameController.text.trim();
    String newDescription = _descriptionController.text.trim();
    String newImageUrl = _imageUrlController.text.trim();
    double newPrice = double.tryParse(_priceController.text.trim()) ??
        0.0; // Obtém o novo preço como um double

    if (newName.isNotEmpty && newDescription.isNotEmpty) {
      Product editedProduct = Product(
        name: newName,
        description: newDescription,
        imageUrl: newImageUrl,
        price: newPrice,
      );

      Navigator.pop(context, editedProduct);
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
        title: Text('Editar Produto'),
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
              onPressed: _saveChanges,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
