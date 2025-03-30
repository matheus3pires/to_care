import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../services/location_service.dart';

class UserService {
  static Future<List<User>> fetchNearbyUsers() async {
    final position = await LocationService.getCurrentLocation();
    if (position == null) throw Exception("Localização não obtida!");

    final response = await http.get(
      Uri.parse(
        'http://localhost:8080/localizacoes/proximos?latitude=${position.latitude}&longitude=${position.longitude}',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => User(name: item.toString())).toList();
    } else {
      throw Exception('Erro ao buscar usuários próximos');
    }
  }
}
