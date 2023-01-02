import 'package:butterfly_app/views/CreateProduct.dart';
import 'package:butterfly_app/views/EditProduct.dart';
import 'package:butterfly_app/views/GenerateToken.dart';
import 'package:butterfly_app/views/Product.dart';
import 'package:butterfly_app/views/ProductDetail.dart';

import '../views/Perfil.dart';
import '../views/Register.dart';

routes() {
  return {
    '/register': (context) => Register(),
    '/perfil': (context) => Perfil(),
    '/products': (context) => ProductView(),
    '/token': (context) => GenerateToken(),
    '/product/detail': (context) => ProductDetail(),
    '/product/create': (context) => CreateProduct(),
    '/product/edit': (context) => EditProduct(),
    '/product/create': (context) => CreateProduct(),
  };
}
