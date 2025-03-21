import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  static Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8080/cuidadores'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => User(name: item.toString())).toList();
      } else {
        throw Exception('Erro ao buscar usuários: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}
