import 'package:flutter/material.dart';
import '../models/user.dart';

class UserList extends StatelessWidget {
  final List<User> users;
  final String searchQuery;

  const UserList({super.key, required this.users, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];

        if (searchQuery.isNotEmpty &&
            !user.name.toLowerCase().contains(searchQuery.toLowerCase())) {
          return const SizedBox.shrink();
        }

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color(0xFF5C7A6E)),
            ),
            title: Text(user.name),
            subtitle: const Text('Informações adicionais...'),
            onTap: () {
              print('Clicou no usuário: ${user.name}');
            },
          ),
        );
      },
    );
  }
}
