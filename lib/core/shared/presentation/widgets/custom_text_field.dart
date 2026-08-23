import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.onChange,
    required this.controller,
    this.isPassword = false,
    this.prefixIconPath,
    this.validator,
    this.canRequestFocus,
    this.isError,
    required this.focusNode,
    this.onSubmitted,
    this.showLableOnTop = true,
    this.isEnabled = true,
  });
  final String hint;
  final bool showLableOnTop;
  final FocusNode focusNode;
  final void Function(String value)? onSubmitted;
  final bool? canRequestFocus;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final TextEditingController controller;
  final bool isPassword;
  final String? prefixIconPath;
  final bool? isError;
  final bool isEnabled;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        enabled: widget.isEnabled,
        canRequestFocus: widget.canRequestFocus ?? true,
        validator: widget.validator,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onSubmitted,
        onTapOutside: (event) => widget.focusNode.unfocus(),
        onChanged: widget.onChange,
        controller: widget.controller,
        obscureText: widget.isPassword && _obscureText,
        decoration: InputDecoration(
          floatingLabelBehavior: widget.showLableOnTop ? .auto : .never,
          helperText: " ",
          helperStyle: const TextStyle(height: .75),
          errorStyle: AppFont.balooThambi2Medium(
            fontSize: 12,
            color: AppColors.mainOrange,
          ).copyWith(height: 1),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: AnimatedCrossFade(
                    firstChild: const Icon(
                      Icons.visibility_outlined,
                      color: AppColors.textGrey,
                      size: 20,
                    ),
                    secondChild: const Icon(
                      Icons.visibility_off_outlined,
                      color: AppColors.textGrey,
                      size: 20,
                    ),
                    crossFadeState: _obscureText
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 38,
            minHeight: 36,
          ),
          prefixIcon: widget.prefixIconPath != null
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16,
                    end:
                        2, // ← reduce this to close the gap between icon and label
                  ),
                  child: SvgPicture.asset(
                    widget.prefixIconPath!,
                    width: 20,
                    height: 20,
                  ),
                )
              : null,
          filled: true,
          fillColor: Colors.transparent,
          labelText: widget.hint,
          labelStyle: AppFont.balooThambi2Regular(
            color: widget.isEnabled ? AppColors.textGrey : AppColors.lightBlack,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.buttonGrey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.buttonGrey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.lightBlack,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        cursorColor: AppColors.buttonGrey,
        cursorHeight: 20,
        style: AppFont.balooThambi2Regular(
          color: widget.isEnabled ? AppColors.textGrey : AppColors.lightBlack,
          fontSize: 14,
        ),
      ),
    );
  }
}
