import 'package:chat_app/constant.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/pages/cubit/chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  //
  sendMessage({required String message, required String email}) {
    try {
      messages
          .add({kMessage: message, kCreatedAt: DateTime.now(), 'id': email});
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  //

  List<Message> messagesList = [];
  getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }

      emit(ChatSuccess(messages: messagesList));
    });
  }
}
