import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:rive/rive.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late RiveAnimationController _rive_controller;

  @override
  void initState(){
    setState(() {
      _rive_controller = OneShotAnimation('Blink');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Speaking to Chacha',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: RiveAnimation.asset(
                'assets/1534-6767-eye-icon.riv',
                controllers: [_rive_controller],
                fit: BoxFit.contain,
                alignment: Alignment.centerRight,
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
