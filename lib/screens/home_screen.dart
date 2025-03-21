import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';
import '../widgets/user_list.dart';
import '../widgets/floating_button.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    try {
      List<User> fetchedUsers = await UserService.fetchUsers();
      setState(() {
        users = fetchedUsers;
      });
    } catch (e) {
      print('Erro ao carregar usuários: $e');
    }
  }

  void onSearch(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  void onLeftIconPressed() {
    print('Ícone à esquerda clicado!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onLeftIconPressed,
        ),
        title: SearchBarWidget(onSearch: onSearch),
      ),
      body: UserList(users: users, searchQuery: searchQuery),
      floatingActionButton: const FloatingButtonWidget(),
    );
  }
}
