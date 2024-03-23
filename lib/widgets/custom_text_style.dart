import 'package:flutter/material.dart';

class CustomTextStyle extends StatelessWidget {
   CustomTextStyle({super.key, required this.hint, required this.labll,this.onChanged,this.obSecurText=false});
    final String hint;
    final String labll;
    Function(String)? onChanged;
    bool? obSecurText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecurText!,
      validator: (data){
        if(data!.isEmpty){
          return 'field is requiared';
        }
      },
        onChanged: onChanged ,
            decoration: InputDecoration(
              hintText: hint,
             label:  Text(labll),
             labelStyle: const TextStyle(color: Colors.white), 
              hintStyle: const TextStyle(color: Colors.grey),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.white,
              )),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.yellow,
              )),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
            ),
          );
        
  }
}