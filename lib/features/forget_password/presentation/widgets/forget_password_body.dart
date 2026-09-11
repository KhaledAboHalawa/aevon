import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:aevon/features/forget_password/presentation/widgets/process_widget.dart';
import 'package:aevon/features/forget_password/presentation/widgets/text_hints_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  late final ForgetPasswordCubit _forgetPasswordCubit;

  @override
  void initState() {
    super.initState();
    _forgetPasswordCubit = getIt<ForgetPasswordCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _forgetPasswordCubit,
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (BuildContext context, state) {
          if (state.errorMessage != null) {
            Fluttertoast.showToast(
              msg: state.errorMessage!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red,
              textColor: AppColors.white,
              fontSize: 14.0,
            );
          }
        },
        builder: (BuildContext context, state) => Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            TextHintsWidget(currentPage: state.currentPage),
            ProcessWidget(currentPage: state.currentPage),
          ],
        ),
      ),
    );
  }
}
