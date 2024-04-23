import 'package:cahtty/pages/cubit/register_cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  Future<void> RegisterUserMethod(
      {required String email, required String password}) async {
    emit(RegisterLoadingState());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegisterFaliurState(errMessege: 'Password is weak'));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegisterFaliurState(errMessege: 'The account already exists'));
      }
    } catch (e) {
      emit(RegisterFaliurState(
          errMessege: 'OOPS! .. There was an error PLZ Try again'));
    }
  }
}
