import 'package:butterfly_app/components/TextInput.dart';
import 'package:butterfly_app/components/buttons.dart';
import 'package:butterfly_app/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class EditProduct extends StatefulWidget {
  const EditProduct({super.key});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  String _selectedSize = "";

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
  // raise the [showDialog] widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Produto"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: _body()),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Icon(Icons.photo_camera),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  width: MediaQuery.of(context).size.width - 200,
                  height: 80,
                  child: _editImages(),
                ))
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 54.0, bottom: 8.0, left: 32.0),
              child: Text(
                "Criar um produto",
                style: TextStyle(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: _form(),
            )
          ],
        ),
      ),
    );
  }

  Widget _editImages() {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(10)),
            width: 80,
            height: 80,
          ),
        );
      },
    );
  }

  Widget _form() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child:
              input(obscure: false, lable: "Nome do produto", context: context),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 128),
          child: input(obscure: false, lable: "Preço", context: context),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                btTextIcon(
                    lable: "Selecionar Cor",
                    textStyle: TextStyle(color: pickerColor, fontSize: 12),
                    icon: Icon(
                      Icons.palette,
                      color: pickerColor,
                    ),
                    call: () {
                      _pickerColor();
                    }),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: pickerColor,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(
            "Tamanhos",
            style: TextStyle(fontSize: 12),
          ),
        ),
        _sizesAvailable(),
        Padding(
          padding: const EdgeInsets.only(right: 200),
          child: input(obscure: false, context: context),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Detalhes",
            style: TextStyle(fontSize: 12),
          ),
        ),
        inputField(
          obscure: false,
          context: context,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32),
          child: btPrimary(context: context, lable: "Salvar", call: () {}),
        )
      ],
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

  Future _pickerColor() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecionar uma Cor!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
            // Use Material color picker:
            //
            // child: MaterialPicker(
            //   pickerColor: pickerColor,
            //   onColorChanged: changeColor,
            //   showLabel: true, // only on portrait mode
            // ),
            //
            // Use Block color picker:
            //
            // child: BlockPicker(
            //   pickerColor: currentColor,
            //   onColorChanged: changeColor,
            // ),
            //
            // child: MultipleChoiceBlockPicker(
            //   pickerColors: currentColors,
            //   onColorsChanged: changeColors,
            // ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Selecionar'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
