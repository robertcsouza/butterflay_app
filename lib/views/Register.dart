import 'package:butterfly_app/components/TextInput.dart';
import 'package:butterfly_app/components/buttons.dart';
import 'package:butterfly_app/controllers/RegisterController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../settings/colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordRepeatController = TextEditingController();
  RegisterController _registerController = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: primary,
          child: _body(),
        ));
  }

  Widget _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Image.asset(
            'images/logo.jpeg',
            width: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8),
          child: input(
              obscure: false,
              context: context,
              lable: 'Email',
              controller: _emailController),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
          child: input(
              obscure: true,
              context: context,
              lable: 'Senha',
              controller: _passwordController),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
          child: input(
              obscure: true,
              context: context,
              lable: 'Repetir senha',
              controller: _passwordRepeatController),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: btPrimary(
              context: context,
              lable: 'Cadastrar',
              call: () {
                _registerController.register(
                  email: _emailController.text,
                  password: _passwordController.text,
                  passwordRepeat: _passwordRepeatController.text,
                );
                Navigator.pushNamed(context, '/register/pincode');
              }),
        ),
      ],
    );
  }
}
