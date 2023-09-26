


  import 'package:flutter/material.dart';

class ChatBurst extends StatefulWidget {
  const ChatBurst({super.key});

  @override
  State<ChatBurst> createState() => _ChatBurstState();
}

class _ChatBurstState extends State<ChatBurst> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Colors.grey,
        
      ),
      child: SizedBox(height: 25,)
    );
  }
}