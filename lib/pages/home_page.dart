import 'package:flutter/material.dart';
import 'package:flutter_chat_client_demo/services/auth/auth_service.dart';
import 'package:flutter_chat_client_demo/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.authService});

  final AuthService authService;

  void logout() {
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          //logout button
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: MyDrawer(
        authService: authService,
      ),
    );
  }
}
