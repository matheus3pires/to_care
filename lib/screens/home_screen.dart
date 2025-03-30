import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import '../widgets/user_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    loadNearbyUsers();
  }

  Future<void> loadNearbyUsers() async {
    try {
      List<User> fetchedUsers = await UserService.fetchNearbyUsers();
      setState(() {
        users = fetchedUsers;
      });
    } catch (e) {
      print('Erro ao carregar usuários próximos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Usuários Próximos")),
      body: UserList(users: users, searchQuery: searchQuery),
      floatingActionButton: FloatingActionButton(
        onPressed: loadNearbyUsers,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
