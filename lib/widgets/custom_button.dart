import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({super.key, required this.text});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){}, child: Text(text, style: TextStyle(fontSize: 17),)
    );
  }
}
