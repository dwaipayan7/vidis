
import 'package:flutter/material.dart';
import 'package:vidis/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton({super.key, required this.onPressed, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow:[
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.06),
                    offset: Offset(0, 4)
                )
              ]
            ),
            height: 60,
            width: 60,
            child: Icon(
              icon, color: Colors.white,size: 30,),
          ),
          SizedBox(height: 10,),
          Text(text, style: TextStyle(
            color: Colors.grey
          ),)
        ],
      ),
    );
  }
}
