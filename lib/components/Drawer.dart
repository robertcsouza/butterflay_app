import 'package:flutter/material.dart';

import '../settings/colors.dart';

Widget drawer({required context, required int index, urlImage}) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: const Color(0xffC48B9F)),
            accountName: Text(
              "Alexsandra Santos",
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            accountEmail: Text(
              "alexsandra.santos@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            currentAccountPicture:
                _thumbImage(urlImage: urlImage, context: context)),
        ListTile(
          selected: index == 1,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.shopping_basket_rounded),
              ),
              Text("Produtos")
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          selected: index == 2 ? true : false,
          selectedColor: dark,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.person),
              ),
              Text("Perfil")
            ],
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
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
        )),
  );
}
