import 'package:flutter/material.dart';
import 'package:flutter_chat_client_demo/services/auth/auth_service.dart';
import 'package:flutter_chat_client_demo/services/auth/login_or_register.dart';
import 'package:flutter_chat_client_demo/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({
    super.key,
    required this.authService,
  });

  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: authService.loggedInStreamController.stream,
        builder: (context, snapshot) {
          //user is loged in
          if (snapshot.hasData && snapshot.data!) {
            return HomePage(
              authService: authService,
            );
          }
          //user is not logged in
          else {
            return LoginOrRegister(authService: authService);
          }
        },
      ),
    );
  }
}
