import 'package:chacha_chaudhary/colors/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  List<String> messages = [];

  void _addMessage(String message) {
    setState(() {
      messages.add(message);
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          'Speaking to Chacha AI',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: uiColor,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              
            },
          );
        }),
      ),
      body: Column(
        
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
  height: 225, width: 225,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/Untitled design (2) (1)_prev_ui.png',),
      fit: BoxFit.cover, 
    
    ),
  ),
  child: null, 
),
            ],
          ),

        Expanded(
              child: ListView.builder(
              reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[messages.length-index-1];
              return ChatBubble(
                text: message,
                isUser: true,
              );
            },
          )),
          SingleChildScrollView(
            child: Align(
             
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                 
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.mic_none_rounded,
                        color: Colors.white,
                      ),
                      backgroundColor: uiColor,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0,2),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _textController,
                          decoration: InputDecoration(
                              hintText: 'Send a message',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 16,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  final text = _textController.text;

                                  if (text.isNotEmpty) {
                                    _addMessage(text);
                                  }
                                },
                                icon: Icon(Icons.send),
                                color: uiColor,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
