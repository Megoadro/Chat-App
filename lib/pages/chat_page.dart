import 'package:cahtty/constants.dart';
import 'package:cahtty/model/messege.dart';
import 'package:cahtty/pages/cubit/chat_cubit/chat_cubit.dart';
import 'package:cahtty/pages/cubit/chat_cubit/chat_state.dart';
import 'package:cahtty/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chatpage extends StatelessWidget {
  final _controller = ScrollController();
  //List<Messege> messegeList = [];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            Text(
              'Your Chat',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messegeList = BlocProvider.of<ChatCubit>(context).messegeList;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messegeList.length,
                  itemBuilder: (context, index) {
                    return messegeList[index].id == email
                        ? ChatBubble(
                            messege: messegeList[index],
                          )
                        : ChatBubbleForFriend(messege: messegeList[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessege(messege: data, email: email);
                controller.clear();
                _controller.animateTo(
                  0,
                  // _controller.position.maxScrollExtent,
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                );
              },
              decoration: InputDecoration(
                  hintText: 'Send Messege...',
                  suffixIcon: Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
