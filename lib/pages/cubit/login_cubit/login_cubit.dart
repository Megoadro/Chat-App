import 'package:cahtty/pages/cubit/login_cubit/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<loginState> {
  LoginCubit() : super(loginInitialState());

  Future<void> LoginUser(
      {required String email, required String password}) async {
    try {
      emit(loginLoadinglState());
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(loginSuccessState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(loginFailuerState(errMessege: 'No user found for that email.'));
      } else if (ex.code == 'wrong-password') {
        emit(loginFailuerState(
            errMessege: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(loginFailuerState(
          errMessege: 'OOPS! .. There was an error PLZ Try again'));
    }
  }
}
