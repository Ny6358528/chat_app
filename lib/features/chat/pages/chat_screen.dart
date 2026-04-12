import 'package:chat_app/core/constants/app_images.dart';
import 'package:chat_app/core/constants/app_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/appbar_widget.dart';
import '../widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final CollectionReference message =
  FirebaseFirestore.instance.collection('message');

  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  late String email;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    email = (ModalRoute.of(context)?.settings.arguments ?? '') as String;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(child: Text("Something went wrong")),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        });

        return Scaffold(
          appBar: AppbarWidget(
            title: AppString.chatName,
            image: AppImages.logoImage,
          ),
          body: Column(
            children: [
              /// الرسائل
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;

                    String senderId = data['id'] ?? '';
                    bool isMe = senderId == email;

                    return ChatBubble(
                      message: data['message'] ?? '',
                      isMe: isMe,
                    );
                  },
                ),
              ),

              /// input
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        onSubmitted: sendMessage,
                        decoration: InputDecoration(
                          hintText: "Send message...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => sendMessage(controller.text),
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    message.add({
      'message': text,
      'createdAt': FieldValue.serverTimestamp(),
      'id': email,
    });

    controller.clear();
  }
}