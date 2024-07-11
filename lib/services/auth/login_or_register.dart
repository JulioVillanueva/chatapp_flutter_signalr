import 'package:flutter/material.dart';
import 'package:flutter_chat_client_demo/services/auth/auth_service.dart';
import 'package:flutter_chat_client_demo/pages/login_page.dart';
import 'package:flutter_chat_client_demo/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key, required this.authService});
  final AuthService authService;
  @override
  State<LoginOrRegister> createState() =>
      _LoginOrRegisterState(authService: authService);
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
//initially, show the loging page
  bool showLoginPage = true;

  _LoginOrRegisterState({required this.authService});

  final AuthService authService;

//toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTab: togglePages, authService: authService);
    } else {
      return RegisterPage(onTap: togglePages, authService: authService);
    }
  }
}
