import 'package:butterfly_app/components/TextInput.dart';
import 'package:butterfly_app/components/buttons.dart';
import 'package:butterfly_app/config/Routes.dart';
import 'package:butterfly_app/settings/colors.dart';
import 'package:butterfly_app/settings/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes(),
      title: 'Butterfly',
      theme: theme,
      home: const MyHomePage(title: 'Butterfly'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          child: input(obscure: false, context: context, lable: 'Email'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
          child: input(obscure: true, context: context, lable: 'Senha'),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: btPrimary(context: context, lable: 'Entrar', call: () {}),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: btText(
              context: context,
              lable: 'Cadastre-se',
              call: () {
                Navigator.pushNamed(context, '/perfil');
              },
              textStyle: TextStyle(color: dark)),
        )
      ],
    );
  }
}
