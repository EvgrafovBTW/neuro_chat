part of 'chat_input_cubit_cubit.dart';

class ChatInputCubitState {
  String input;
  ChatInputCubitState({
    this.input = '',
  });
  ChatInputCubitState copyWith({
    String? input,
  }) {
    return ChatInputCubitState(
      input: input ?? this.input,
    );
  }
}
