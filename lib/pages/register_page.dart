import 'package:flutter/material.dart';
import 'package:flutter_chat_client_demo/services/auth/auth_service.dart';
import 'package:flutter_chat_client_demo/components/my_button.dart';
import 'package:flutter_chat_client_demo/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
//authService
  final AuthService authService;

//email and pw text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  //register method
  void register(BuildContext context) async {
    if (_pwController.text == _confirmPwController.text) {
      //password match -> create user
      try {
        await authService.signUpAndSignInWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
    //password dont match -> tell user to fix
    else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Password don't match"),
              ));
    }
  }

  //tap to go to register page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap, required this.authService});

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
            "Let's create an account for you",
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

          const SizedBox(height: 10),

          //confirm pw textfield
          MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPwController),

          const SizedBox(height: 25),

          //loging btn
          MyButton(
            text: "Register",
            onTab: () => register(context),
          ),

          const SizedBox(height: 25),
          //register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Login now",
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
