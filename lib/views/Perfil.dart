import 'package:butterfly_app/components/Drawer.dart';
import 'package:butterfly_app/components/TextInput.dart';
import 'package:butterfly_app/components/buttons.dart';
import 'package:butterfly_app/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  bool _toggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context: context, index: 2),
      appBar: AppBar(
        title: Text("Perfil"),
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
          padding: const EdgeInsets.only(top: 32.0),
          child: _thumbImage(
              urlImage:
                  'https://seletivaforum.com.br/seletiva/wp-content/uploads/2019/07/perfil-fashion.png'),
        ),
        _toggleForm(),
      ],
    );
  }

  Widget _toggleForm() {
    if (_toggle == false) {
      return Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Alexsanda santos da silva"),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _toggle = !_toggle;
                      });
                    },
                    icon: Icon(Icons.edit)),
              ],
            ),
            btText(
                lable: 'Sair', call: () {}, textStyle: TextStyle(color: dark))
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 64.0),
            child: input(obscure: false, lable: 'Nome', context: context),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 32.0, bottom: 16.0, left: 64.0, right: 64.0),
            child: btPrimary(
                context: context,
                lable: 'Salvar',
                call: () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }),
          )
        ],
      );
    }
  }

  Widget _thumbImage({urlImage}) {
    return Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
            color: gray,
            border: Border.all(color: dark, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Stack(
          children: <Widget>[
            urlImage != null
                ? Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        urlImage,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  )
                : Center(
                    child: Icon(
                      Icons.person,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                  ),
            Container(
              width: 120,
              height: 120,
              color: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withAlpha(0),
                    Colors.black12,
                    Colors.black45
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: const Text(
                  'Alterar foto',
                  style: TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              ),
            ),
          ],
        ));
  }
}
