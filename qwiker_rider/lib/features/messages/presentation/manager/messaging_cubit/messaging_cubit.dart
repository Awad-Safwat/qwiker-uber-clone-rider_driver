import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/features/messages/data/message_models.dart';
import 'package:qwiker_rider/features/messages/presentation/widgets/constants.dart';

part 'messaging_state.dart';

class MessagingCubit extends Cubit<MessagingState> {
  MessagingCubit() : super(MessagingInitial());

  List<MessageModel> messagesList = [];
  TextEditingController textFieldController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  StreamSubscription<QuerySnapshot>? _messagesSubscription;
  CollectionReference messages = FirebaseFirestore.instance
      .collection('onGoingTrips')
      .doc(getPhoneNumber())
      .collection('messages');

// Start listening to new messages.
  void startListeningToMessages() {
    _messagesSubscription = messages
        .orderBy(
          kSendTime,
          descending: true,
        )
        .snapshots()
        .listen(_onMessagesUpdate);
  }

// Listener function to handle new messages.
  void _onMessagesUpdate(QuerySnapshot event) {
    print(event.docs);
    if (event.docs.isEmpty || event.metadata.isFromCache) {
      print('no messages');
      emit(NoMessagesYet());
    } else {
      messagesList.clear();
      print(event.docs);
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }
      emit(NewMessages());
    }
  }

// Stop listening to messages.
  void stopListeningToMessages() {
    _messagesSubscription?.cancel();
  }

  Future<void> sendMessage() async {
    MessageModel newMessage = MessageModel(
        senderId: getPhoneNumber(),
        messageBody: textFieldController.text,
        messageTime: DateTime.now());
    await messages.add(newMessage.toJson());
  }
}
