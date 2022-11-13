import 'package:flutter/material.dart';
import 'package:neuro_chat/models/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: (message.messageType == MessageType.get
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (message.messageType == MessageType.get
                ? Colors.grey.shade200
                : Colors.indigo[200]),
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            message.messageContent,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
