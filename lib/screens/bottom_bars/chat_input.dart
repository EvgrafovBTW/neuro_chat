import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_chat/colors.dart';
import 'package:neuro_chat/logic/chat_input_cubit_cubit.dart';

class ChatTextInput extends StatefulWidget {
  const ChatTextInput({super.key});

  @override
  State<ChatTextInput> createState() => _ChatTextInputState();
}

class _ChatTextInputState extends State<ChatTextInput> {
  TextEditingController chatController = TextEditingController();
  late ChatInputCubitState chatState;
  @override
  void initState() {
    chatState =
        BlocProvider.of<ChatInputCubitCubit>(context, listen: false).state;
    chatController.addListener(updateMessage);
    super.initState();
  }

  updateMessage() {
    chatState.input = chatController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      // width: MediaQuery.of(context).size.width,
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
          // Expanded(child: TextField()),
          Expanded(
            flex: 1,
            child: TextField(
              controller: chatController,
              style: TextStyle(
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
            icon: Icon(Icons.send),
            onPressed: () {
              // var text = messageController.text.trim();
              // if (text != '')
              //   runMutation({'chatId': chatDetails.id, 'text': text});
              // messageController.clear();
            },
          )
        ],
      ),
    );
  }
}
