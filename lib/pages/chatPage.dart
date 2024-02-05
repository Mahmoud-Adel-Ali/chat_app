// ignore_for_file: must_be_immutable

import 'package:chat_app/constant.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/pages/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  final _controller = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();

  ChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text("..Error please try again.."),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Text("Loading...."),
            ),
          );
        }
        List<Message> messagesList = [];
        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
        }

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  kLogo,
                  height: 50,
                ),
                const Text('chat'),
              ],
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(
                              message: messagesList[index],
                            )
                          : ChatBubleForFriend(message: messagesList[index]);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    messages.add(
                      {kMessage: data, kCreatedAt: DateTime.now(), 'id': email},
                    );
                    controller.clear();
                    _controller.animateTo(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  decoration: InputDecoration(
                    hintText: 'Send Message',
                    suffixIcon: const Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
