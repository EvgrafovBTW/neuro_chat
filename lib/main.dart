import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neuro_chat/colors.dart';
import 'package:neuro_chat/logic/chat_input_cubit_cubit.dart';
import 'package:neuro_chat/logic/user_credential_cubit.dart';
import 'package:neuro_chat/router/app_router.dart';
import 'package:neuro_chat/screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCredentialCubit>(
          create: (context) => UserCredentialCubit(),
        ),
        BlocProvider<ChatInputCubitCubit>(
          create: (context) => ChatInputCubitCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: appPrimaryColor,
        ),
        home: const Auth(),
        onGenerateRoute: appRouter.onGeneratRoute,
      ),
    );
  }
}
