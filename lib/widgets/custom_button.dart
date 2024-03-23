import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.text,this.onTap});
  final String text;
   VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text(text)),
              ),
    );
          
  }
}