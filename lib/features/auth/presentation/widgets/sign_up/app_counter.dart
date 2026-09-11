import 'dart:math' as math;

import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';

class HorizontalNumberPicker extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final ValueChanged<int> onChanged;
  final String label;

  const HorizontalNumberPicker({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onChanged,
    this.label = 'Year',
  });

  @override
  State<HorizontalNumberPicker> createState() => _HorizontalNumberPickerState();
}

class _HorizontalNumberPickerState extends State<HorizontalNumberPicker> {
  double get _itemExtent => (widget.maxValue > 99) ? 75 : 64;

  late final FixedExtentScrollController _controller;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialValue - widget.minValue;
    _controller = FixedExtentScrollController(initialItem: _selectedIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int get _itemCount => widget.maxValue - widget.minValue + 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.label,
          style: AppFont.balooThambi2SemiBold(
            color: AppColors.mainOrange,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 90,
          child: RotatedBox(
            // Rotate a vertical wheel to behave horizontally.
            quarterTurns: -1,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: _itemExtent,
              diameterRatio: 2.2,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() => _selectedIndex = index);
                widget.onChanged(widget.minValue + index);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: _itemCount,
                builder: (context, index) {
                  final value = widget.minValue + index;
                  final isSelected = index == _selectedIndex;
                  final distance = (index - _selectedIndex).abs();

                  return RotatedBox(
                    // Rotate the content back so text reads upright.
                    quarterTurns: 1,
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: AppFont.balooThambi2ExtraBold(
                          fontSize: isSelected ? 44 : 26,
                          color: isSelected
                              ? AppColors.mainOrange
                              : AppColors.textGrey.withValues(
                                  alpha: math.max(0.25, 1 - distance * 0.18),
                                ),
                        ),
                        child: Text('$value'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Icon(Icons.arrow_drop_up, color: AppColors.mainOrange, size: 32),
      ],
    );
  }
}
