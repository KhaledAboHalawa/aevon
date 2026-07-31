import 'package:aevon/features/auth/presentation/widgets/blured_card.dart';
import 'package:aevon/features/forget_password/presentation/widgets/processes/forget_password_sent_email_widget.dart';
import 'package:flutter/material.dart';

class ProcessWidget extends StatefulWidget {
  const ProcessWidget({super.key, required this.currentPage});
  final int currentPage;
  @override
  State<ProcessWidget> createState() => _ProcessWidgetState();
}

class _ProcessWidgetState extends State<ProcessWidget> {
  List<Widget> pages = [const ForgetPasswordSentEmailWidget()];
  @override
  Widget build(BuildContext context) {
    return BluredCard(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        child: pages[widget.currentPage],
      ),
    );
  }
}
