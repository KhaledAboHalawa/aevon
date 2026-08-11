import 'package:aevon/features/ai_chat/presentation/widgets/chat_header.dart';
import 'package:flutter/material.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      ChatHeader(isInboarding: false, userName: "Aevon"),
      ],
    );
  }
}
