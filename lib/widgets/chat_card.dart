import 'package:chacha_chaudhary/colors/colors.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatBubble({
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(isUser ? 12 : 0),
      bottomRight: Radius.circular(isUser ? 0 : 12),
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isUser ? chatBoxColor: Colors.grey,
            borderRadius: borderRadius,
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white,fontSize: 17),
          ),
        ),
      ),
    );
  }
}
