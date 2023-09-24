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
          'Speaking to Chacha Chad',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 48, 228, 183),
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
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return ChatBubble(
                text: message,
                isUser: true,
              );
            },
          )),
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.mic_none_rounded,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 48, 228, 183),
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
                              offset: Offset(0, 3),
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
                                color: Color.fromARGB(255, 48, 228, 183),
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
