import 'package:cahtty/model/messege.dart';

abstract class ChatState{}
class ChatInitialState extends ChatState{}
class ChatSuccessState extends ChatState{
  List<Messege> messeges;
  ChatSuccessState({required this.messeges});
}