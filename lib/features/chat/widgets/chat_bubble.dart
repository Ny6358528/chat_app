import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft:
            isMe ? const Radius.circular(15) : const Radius.circular(0),
            bottomRight:
            isMe ? const Radius.circular(0) : const Radius.circular(15),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}