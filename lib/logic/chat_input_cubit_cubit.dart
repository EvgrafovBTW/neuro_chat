import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'chat_input_cubit_state.dart';

class ChatInputCubitCubit extends Cubit<ChatInputCubitState> {
  ChatInputCubitCubit() : super(ChatInputCubitState());
}
