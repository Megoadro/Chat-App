import 'package:cahtty/constants.dart';
import 'package:cahtty/model/messege.dart';
import 'package:cahtty/pages/cubit/chat_cubit/chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitialState());
  CollectionReference messeges =
      FirebaseFirestore.instance.collection(kMessegesCollections);
  void sendMessege({required String messege, required String email}) {
    try {
      messeges.add(
        {
          kMessege: messege,
          kCreatedAt: DateTime.now(),
          'id': email,
        },
      );
    } on Exception catch (e) {
      // TODO
    }
  }

  void getMessege() {
    messeges.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Messege> messegeList = [];
      for (var doc in event.docs) {
        messegeList.add(Messege.fromjson(doc));
      }
      emit(ChatSuccessState(messeges: messegeList));
    });
  }
}
