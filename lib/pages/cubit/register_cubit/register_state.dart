abstract class RegisterState{}
class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{}
class RegisterFaliurState extends RegisterState{
  String errMessege;
  RegisterFaliurState({required this.errMessege});
}