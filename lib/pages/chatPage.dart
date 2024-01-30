// ignore_for_file: must_be_immutable

import 'package:chat_app/constant.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});
  static String id = "ChatPage";
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          // Expanded(
          //   child: ListView.builder(
          //       reverse: true,
          //       // controller: _controller,
          //       // itemCount: messagesList.length,
          //       itemBuilder: (context, index) {
          //         return messagesList[index].id == email ?  ChatBuble(
          //           message: messagesList[index],
          //         ) : ChatBubleForFriend(message: messagesList[index]);
          //       }),
          // ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                // messages.add(
                //   {kMessage: data, kCreatedAt: DateTime.now(), 'id' : email },

                // );
                // controller.clear();
                // _controller.animateTo(0,
                // duration: const Duration(milliseconds: 500),
                // curve: Curves.easeIn);
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
  }
}
