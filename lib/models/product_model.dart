import 'dart:async';
import 'dart:typed_data' as typed_data;

import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Product {
  final String name;
  final String description;
  final String imageUrl;
  final bool isAdmin;
  final double price; // Novo atributo price

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price, // Inclua o price no construtor
    this.isAdmin = false,
  });

  Future<typed_data.Uint8List> getCompressedImage() async {
    typed_data.Uint8List imageBytes = await _getNetworkImageBytes();
    typed_data.Uint8List resizedImageBytes =
        await FlutterImageCompress.compressWithList(
      imageBytes,
      minHeight: 50,
      minWidth: 50,
    );
    return resizedImageBytes;
  }

  Future<typed_data.Uint8List> _getNetworkImageBytes() async {
    try {
      final ByteData data =
          await NetworkAssetBundle(Uri.parse(imageUrl)).load('');
      return data.buffer.asUint8List();
    } catch (e) {
      throw Exception('Failed to load network image: $imageUrl');
    }
  }
}
