import 'package:applaluz_chat/models/user.dart';
import 'package:applaluz_chat/models/users_response.dart';
import 'package:applaluz_chat/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:applaluz_chat/global/environment.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Environment.apiUrl}/usuarios', headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
