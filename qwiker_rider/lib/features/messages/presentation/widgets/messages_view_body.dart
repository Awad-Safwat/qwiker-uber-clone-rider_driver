import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/features/messages/presentation/manager/messaging_cubit/messaging_cubit.dart';
import 'package:qwiker_rider/features/messages/presentation/widgets/custom_message_shape.dart';

class MessagesViewBody extends StatelessWidget {
  const MessagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var messagingCubit = getIt<MessagingCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whaite,
        // elevation: 0,
        title: const Text('Chat'),
      ),
      body: PopScope(
        onPopInvoked: (_) {
          messagingCubit.emit(MessagesWaiting());
        },
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<MessagingCubit, MessagingState>(
                builder: (context, state) {
                  return ListView.builder(
                    reverse: true,
                    controller: messagingCubit.scrollController,
                    itemCount: messagingCubit.messagesList.length,
                    itemBuilder: (context, index) {
                      return messagingCubit.messagesList[index].senderId ==
                              getPhoneNumber()
                          ? SelfMessageShape(
                              message: messagingCubit.messagesList[index])
                          : PartnerMessageShape(
                              message: messagingCubit.messagesList[index]);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: messagingCubit.textFieldController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () async {
                        await messagingCubit.sendMessage();

                        messagingCubit.textFieldController.clear();
                        messagingCubit.scrollController.animateTo(
                          messagingCubit
                              .scrollController.position.minScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const Icon(Icons.send)),
                  suffixIconColor: AppColors.mainBlue,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  focusColor: AppColors.gray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
