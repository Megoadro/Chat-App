import 'package:cahtty/constants.dart';
import 'package:cahtty/model/messege.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.messege});
   final Messege messege;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Container(
          //alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8 ),
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: kPrimaryColor,
          ),
          child: Text(
            messege.messege,
            style: TextStyle(color: Colors.white),
          ),
        ),
    );
  }
}





class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({super.key, required this.messege});
   final Messege messege;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: Container(
          //alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8 ),
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: Colors.amber,
          ),
          child: Text(
            messege.messege,
            style: TextStyle(color: Colors.black),
          ),
        ),
    );
  }
}