import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  final int pageNumber;
  final bool? lastPage;

  const BookPage({required this.pageNumber, this.lastPage, super.key});

  bool get isFirstPage => this.pageNumber == 1;

  bool get isLastPage => (this.lastPage ?? false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício 10"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/mainHome");
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: Center(
        child: Text(
          "Página ${this.pageNumber}",
          style: TextStyle(fontSize: 34),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: (!this.isFirstPage
                  ? () {
                      Navigator.of(context)
                          .pushReplacementNamed("/${this.pageNumber - 1}");
                    }
                  : null),
              icon: Icon(Icons.arrow_back)),
          IconButton(
              onPressed: (!this.isLastPage
                  ? () {
                      Navigator.of(context)
                          .pushReplacementNamed("/${this.pageNumber + 1}");
                    }
                  : null),
              icon: Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
