abstract class loginState{}
class loginInitialState extends loginState{}
class loginLoadinglState extends loginState{}
class loginSuccessState extends loginState{}
class loginFailuerState extends loginState{
  String errMessege;
  loginFailuerState({required this.errMessege});
}