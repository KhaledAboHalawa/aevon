import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/features/auth/presentation/widgets/sign_up/app_counter.dart';
import 'package:aevon/features/profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditWeightSection extends StatefulWidget {
  const EditWeightSection({super.key});
  @override
  State<EditWeightSection> createState() => _EditWeightSectionState();
}

class _EditWeightSectionState extends State<EditWeightSection> {
  late final EditProfileCubit editProfileCubit;
  int weight = 0;
  @override
  void initState() {
    super.initState();
    editProfileCubit = getIt<EditProfileCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HorizontalNumberPicker(
          label: AppLocalizations.of(context)!.kg,
          minValue: 30,
          maxValue: 250,
          initialValue: 30,
          onChanged: (int value) {
            setState(() {
              weight = value;
            });
          },
        ),
        const SizedBox(height: 30),
        BlocConsumer<EditProfileCubit, EditProfileState>(
          bloc: editProfileCubit,
          buildWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.status == .error) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            } else if (state.status == .success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Profile updated successfully")),
              );
              context.pop();
            }
          },
          builder: (context, state) => CustomButton(
            backgroundColor: AppColors.mainOrange,
            title: AppLocalizations.of(context)!.next,
            isLoading: state.status == .loading,
            onPressed: (weight == 0)
                ? null
                : () => editProfileCubit.doIntent(
                    EditProfileUpdateWeightEvent(weight.toDouble()),
                  ),
          ),
        ),
      ],
    );
  }
}
