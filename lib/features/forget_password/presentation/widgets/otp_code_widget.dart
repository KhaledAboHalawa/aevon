import 'package:aevon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpCodeWidget extends StatefulWidget {
  final int length;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String>? onChanged;

  const OtpCodeWidget({
    super.key,
    this.length = 4,
    required this.onCompleted,
    this.onChanged,
  });

  @override
  State<OtpCodeWidget> createState() => _OtpCodeWidgetState();
}

class _OtpCodeWidgetState extends State<OtpCodeWidget> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  int _currentIndex() {
    for (int i = 0; i < widget.length; i++) {
      if (_controllers[i].text.isEmpty) return i;
    }
    return widget.length - 1;
  }

  void _focusCurrent() {
    final index = _currentIndex();
    _focusNodes[index].requestFocus();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus(); 
        final otp = _controllers.map((c) => c.text).join();
        widget.onCompleted(otp);
      }
    }
  }

  void _onKeyEvent(KeyEvent event, int index) {
    // move to previous field on backspace when current field is empty
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
      _controllers[index - 1].clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _focusCurrent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.length, (index) {
          return _buildOtpField(index);
        }),
      ),
    );
  }

  Widget _buildOtpField(int index) {
    return SizedBox(
      width: 56,
      child: KeyboardListener(
        focusNode: FocusNode(
          skipTraversal: true,
        ), // extra listener node, not the field's own
        onKeyEvent: (event) => setState(() {
          _onKeyEvent(event, index);
        }),
        child: AbsorbPointer(
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            autofocus: index == 0,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            showCursor: false,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.mainOrange,
            ),
            enableInteractiveSelection: false,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: '', // hides the maxLength counter
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: (_controllers[index].text.isNotEmpty)
                      ? AppColors.mainOrange
                      : AppColors.white,
                  width: 1.6,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainOrange, width: 1.6),
              ),
            ),
            onTap: () => setState(() {
              _focusNodes[index].requestFocus();
            }), // refresh to update border color
            onChanged: (value) => _onChanged(value, index),
            onTapOutside: (event) {
              if (_focusNodes[index].hasFocus) {
                _focusNodes[index].unfocus();
              }
            },
          ),
        ),
      ),
    );
  }
}
