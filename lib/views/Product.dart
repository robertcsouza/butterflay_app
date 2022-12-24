import 'package:butterfly_app/components/Card.dart';
import 'package:butterfly_app/components/Drawer.dart';
import 'package:butterfly_app/components/TextInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context: context, index: 1),
      appBar: AppBar(
        title: Text('Produtos'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: inputSearch(
              obscure: false,
              context: context,
              lable: 'Pesquisar',
              call: () {}),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: cardProduct(context: context),
              );
            },
          ),
        ))
      ],
    );
  }
}
