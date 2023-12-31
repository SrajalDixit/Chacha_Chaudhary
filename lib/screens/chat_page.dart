import 'package:chacha_chaudhary/colors/colors.dart';
import 'package:chacha_chaudhary/widgets/chat_bubble.dart';
import 'package:chacha_chaudhary/widgets/imageShadow.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_card.dart';

class ChatPage extends StatefulWidget {
  //final String response;
  const ChatPage({Key? key ,}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  List<String> messages = [];
  bool isChat = false;
  
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
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
  height: 225, width: 400,
  decoration: BoxDecoration(
    image: DecorationImage(
      alignment: Alignment.topLeft,
      image: AssetImage('assets/Untitled design (2) (1)_prev_ui.png',
      
      ),
      //fit: BoxFit.cover, 
    
    ),
    
  ),
  child: null
),
Positioned(right: -55, bottom: -15,
  child: Image.asset('assets/ccb.png', height: 250, width: 350,),
  
  ),
  Positioned(right: 10, bottom: 65,
  child: Container( height: 150, width: 200, padding: EdgeInsets.all(20), 
  child: SingleChildScrollView(
    child: Text('',style: TextStyle(fontFamily: 'Comic-Neue', fontWeight: FontWeight.w900), softWrap: true,)),),
  
  )
]
)
            ],
          ),

        Expanded(
              child: Container(margin: EdgeInsets.only(left: 10, right: 10),
              
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.grey.withOpacity(0.5),
                  //   spreadRadius: 0,
                  //   //blurRadius: 5,
                  //   offset: Offset(-7,-5),
                  // ),
                ],
              ),
                child: Stack(children:  [
                  Container
                  (

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
                        ),
                        ),
                        ChatShadow()
                        ]
                        )
              )
          ),
          
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
