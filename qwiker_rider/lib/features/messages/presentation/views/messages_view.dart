import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/features/messages/presentation/manager/messaging_cubit/messaging_cubit.dart';

import 'package:qwiker_rider/features/messages/presentation/widgets/messages_view_body.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<MessagingCubit>(),
      child: const MessagesViewBody(),
    );
  }
}
