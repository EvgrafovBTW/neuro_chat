import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_chat/logic/chat_input_cubit_cubit.dart';
import 'package:neuro_chat/models/chat_message.dart';
import 'package:neuro_chat/screens/app_bars/chat_app_bar.dart';
import 'package:neuro_chat/screens/bottom_bars/chat_input.dart';
import 'package:neuro_chat/screens/components/chat_bubble.dart';

import '../colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  StreamController<ChatMessage> messageController =
      StreamController<ChatMessage>();
  TextEditingController chatController = TextEditingController();
  late ChatInputCubitState chatState;
  late Stream messageStream;
  late ChatMessage lastM;
  List<ChatMessage> msgListPost = [];
  @override
  void initState() {
    chatState =
        BlocProvider.of<ChatInputCubitCubit>(context, listen: false).state;
    chatController.addListener(updateMessage);
    messageStream = messageController.stream.asBroadcastStream();
    super.initState();
  }

  @override
  void dispose() {
    messageController.close();
    super.dispose();
  }

  updateMessage() {
    chatState.input = chatController.text;
  }

  @override
  Widget build(BuildContext context) {
    // msgQueueGet.
    return Scaffold(
      appBar: const ChatAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white70,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: messageStream,
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text('Напишите "Привет!"'),
                      );
                    }
                    msgListPost.add(snapshot.data);
                    return ListView.builder(
                        itemCount: msgListPost.length,
                        itemBuilder: ((context, index) {
                          return ChatBubble(
                            message: msgListPost[index],
                          );
                        }));
                  })),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: appPrimaryColor.withOpacity(0.2),
                    ),
                  ],
                  color: Colors.white70,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: chatController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Tap to send a message",
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 18,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      color: appPrimaryColor,
                      icon: const Icon(Icons.send),
                      onPressed: () async {
                        if (chatController.text != '') {
                          String txt = chatController.text;
                          messageController.sink.add(ChatMessage(
                              messageContent: chatController.text,
                              messageType: MessageType.post));
                          chatController.clear();
                          await Future.delayed(const Duration(seconds: 1));
                          messageController.sink.add(ChatMessage(
                              messageContent: 'Вы написали: $txt',
                              messageType: MessageType.get));
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
