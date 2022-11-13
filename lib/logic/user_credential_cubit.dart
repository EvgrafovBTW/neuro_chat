import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_credential_state.dart';

class UserCredentialCubit extends Cubit<UserCredentialState> {
  UserCredentialCubit() : super(UserCredentialState());
}
