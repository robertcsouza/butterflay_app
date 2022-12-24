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
  };
}
