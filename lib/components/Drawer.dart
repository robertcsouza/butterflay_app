import 'package:flutter/material.dart';

import '../settings/colors.dart';

Widget drawer({required context, required int index, urlImage}) {
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: const Color(0xffC48B9F)),
            accountName: const Text(
              "Alexsandra Santos",
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            accountEmail: const Text(
              "alexsandra.santos@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            currentAccountPicture:
                _thumbImage(urlImage: urlImage, context: context)),
        ListTile(
          selected: index == 1,
          selectedColor: dark,
          title: Row(
            children: const [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.checkroom),
              ),
              Text("Catálogo")
            ],
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/products');
          },
        ),
        ListTile(
          selected: index == 3,
          selectedColor: dark,
          title: Row(
            children: const [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.dry_cleaning_rounded),
              ),
              Text("Adicionar Roupa")
            ],
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/product/create');
          },
        ),
        ListTile(
          selected: index == 2 ? true : false,
          selectedColor: dark,
          title: Row(
            children: const [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.person),
              ),
              Text("Perfil")
            ],
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/perfil');
          },
        ),
        ListTile(
          selected: index == 3 ? true : false,
          selectedColor: dark,
          title: Row(
            children: const [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.pattern),
              ),
              Text("Gerar Token")
            ],
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/token');
          },
        ),
      ],
    ),
  );
}

Widget _thumbImage({urlImage, context}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/perfil');
    },
    child: Container(
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
                borderRadius: const BorderRadius.all(Radius.circular(100)),
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
              child: const Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: const Text(
                  'Alterar foto',
                  style: const TextStyle(color: Colors.white, fontSize: 10.0),
                ),
              ),
            ),
          ],
        )),
  );
}
