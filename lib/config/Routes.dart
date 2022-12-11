import '../views/Perfil.dart';
import '../views/Register.dart';

routes() {
  return {
    '/register': (context) => Register(),
    '/perfil': (context) => Perfil(),
  };
}
