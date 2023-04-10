import 'package:flutter/material.dart';

import '../../controllers/user_controller.dart';
import '../../models/user/user_model.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<UserModel> users = [];

  UserController controller = UserController();

  _init() async {
    List<UserModel> response = await controller.getUsers();
    setState(() {
      users = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: users.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) => ListTile(
                    title: Text(users[index].name ?? ""),
                    subtitle: Text(users[index].email ?? ""),
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: users.length)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
