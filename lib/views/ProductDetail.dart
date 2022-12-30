import 'package:butterfly_app/components/buttons.dart';
import 'package:butterfly_app/settings/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String _selectedSize = "";
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do produto'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(child: _body()),
      ),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 1000)),
                    ))
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: btTextIcon(
            icon: Icon(Icons.edit, color: dark),
            textStyle: TextStyle(color: dark),
            lable: "Editar",
            context: context,
            call: () {
              Navigator.pushNamed(context, '/product/edit');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Short jeans Cintura alta',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              Text(
                'R\$ 25,00',
                style: TextStyle(
                    color: dark, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 32.0, top: 32),
                child: Text('Cor'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 8),
                child: _colorAvailable(context: context),
              )
            ]),
        Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text('Tamanhos disponíveis'),
                  ),
                  Container(
                    child: _sizesAvailable(context: context),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16),
          child: Row(
            children: [
              Text("Disponibilidade"),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "08 em estoque",
                  style: TextStyle(color: dark),
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Detalhes"),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic"),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 16.0, left: 64, right: 64, bottom: 64),
          child: btPrimary(
              context: context,
              lable: "vender",
              textStyle: const TextStyle(color: Colors.white)),
        )
      ],
    );
  }

  Widget _colorAvailable({context}) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(100)),
    );
  }

  Widget _sizesAvailable({context}) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 8.0,
        bottom: 8,
      ),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 8, top: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSize = "p";
                });
              },
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: _selectedSize == "p" ? Colors.blue : dark,
                      width: 1.5),
                ),
                child: const Center(
                    child: Text(
                  'P',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 8, top: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSize = "M";
                });
              },
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: _selectedSize == "M" ? Colors.blue : dark,
                      width: 1.5),
                ),
                child: const Center(
                    child: Text(
                  'M',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 8, top: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSize = "G";
                });
              },
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: _selectedSize == "G" ? Colors.blue : dark,
                      width: 1.5),
                ),
                child: const Center(
                    child: Text(
                  'G',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
