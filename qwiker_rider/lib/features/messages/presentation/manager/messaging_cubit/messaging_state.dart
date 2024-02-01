part of 'messaging_cubit.dart';

@immutable
sealed class MessagingState {}

final class MessagingInitial extends MessagingState {}

class NewMessages extends MessagingState {}

class MessagesFalure extends MessagingState {}

class MessagesLoading extends MessagingState {}

class NoMessagesYet extends MessagingState {}

class MessagesWaiting extends MessagingState {}
