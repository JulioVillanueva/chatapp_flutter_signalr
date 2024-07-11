import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  
final void Function()? onTab;  
final String text;

const MyButton({super.key,
 required this.text,
 required this.onTab
 });


 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(text)
          )
      ),
    );
  }
}