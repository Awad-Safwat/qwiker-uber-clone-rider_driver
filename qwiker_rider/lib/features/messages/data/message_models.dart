import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwiker_rider/features/messages/presentation/widgets/constants.dart';

class MessageModel {
  String messageBody;
  DateTime messageTime;
  String senderId;

  MessageModel({
    required this.senderId,
    required this.messageBody,
    required this.messageTime,
  });

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      messageBody: jsonData[kMessage],
      messageTime: (jsonData[kSendTime] as Timestamp).toDate(),
      senderId: jsonData[kSenderId],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kMessage: messageBody,
      kSendTime: messageTime,
      kSenderId: senderId,
    };
  }
}
