import 'dart:async';

import 'package:butterfly_app/components/buttons.dart';
import 'package:butterfly_app/components/snackBar.dart';
import 'package:butterfly_app/settings/colors.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String? phoneNumber;

  const PinCodeVerificationScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  void _validate() {
    if (currentText.length < 4) {
      showSnackbar(context: context, menssage: "Preencha corretamente !");
    } else {
      Navigator.pushReplacementNamed(context, "/products");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primary,
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('images/logo.jpeg'),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Token de verificação',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: dark,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: false,

                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 4) {
                          return null;
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldOuterPadding: EdgeInsets.all(8),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          inactiveColor: Colors.grey,
                          activeFillColor: Colors.white,
                          selectedColor: Colors.green,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white),
                      cursorColor: gray,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      mainAxisAlignment: MainAxisAlignment.center,
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");

                        return true;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 64.0, right: 64, top: 64),
                child: btPrimary(
                  context: context,
                  lable: "enviar",
                  call: _validate,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
