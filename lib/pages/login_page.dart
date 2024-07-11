import 'package:flutter/material.dart';
import 'package:flutter_chat_client_demo/services/auth/auth_service.dart';
import 'package:flutter_chat_client_demo/components/my_button.dart';
import 'package:flutter_chat_client_demo/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //authService
  final AuthService authService;
//email and pw text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

//tab to go to register page
  final void Function()? onTab;

  LoginPage({super.key, required this.onTab, required this.authService});

//login  method
  void login(BuildContext context) async {
    //try login
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(height: 50),

          //welcome back message
          Text(
            "Welcome back, you have been missed!",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 16),
          ),

          const SizedBox(height: 25),

          //email text field
          MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController),

          const SizedBox(height: 10),

          //pw textfield
          MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _pwController),

          const SizedBox(height: 25),

          //loging btn
          MyButton(
            text: "Login",
            onTab: () => login(context),
          ),

          const SizedBox(height: 25),
          //register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not a member? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTab,
                child: Text(
                  "Register here",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
