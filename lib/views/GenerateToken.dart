import 'package:butterfly_app/components/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/TextInput.dart';
import '../components/buttons.dart';
import '../settings/colors.dart';

class GenerateToken extends StatefulWidget {
  const GenerateToken({super.key});

  @override
  State<GenerateToken> createState() => _GenerateTokenState();
}

class _GenerateTokenState extends State<GenerateToken> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context: context, index: 3),
      appBar: AppBar(
        title: Text('Token'),
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
          padding: const EdgeInsets.only(top: 48.0),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: dark, width: 4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  '3356',
                  style: TextStyle(fontSize: 36, color: dark),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 64.0, left: 32.0, right: 32.0),
          child: input(obscure: false, lable: 'Email', context: context),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 32.0, bottom: 16.0, left: 64.0, right: 64.0),
          child: btPrimary(context: context, lable: 'Salvar', call: () {}),
        )
      ],
    );
  }
}
