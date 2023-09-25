

import 'package:flutter/material.dart';

class ChatShadow extends StatelessWidget {
  const ChatShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: MediaQuery.of(context).size.height * 0.01,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.5),
          Colors.black.withOpacity(0.0)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        
        )

  
      ),
    );
  }
}