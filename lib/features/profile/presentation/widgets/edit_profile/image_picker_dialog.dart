import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> showImagePickerDialog(BuildContext context) async {
  XFile? image;
  await showDialog<XFile>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.cardDark,
        title: Text(
          "Select Image",
          style: AppFont.balooThambi2SemiBold(
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: AppColors.mainOrange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.camera_alt, color: AppColors.white),
              ),
              title: Text(
                "Camera",
                style: AppFont.balooThambi2SemiBold(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
              onTap: () async {
                image = await _pickAnImage(source: ImageSource.camera);
                if (context.mounted) Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: AppColors.mainOrange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.photo, color: AppColors.white),
              ),
              title: Text(
                "Gallery",
                style: AppFont.balooThambi2SemiBold(
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
              onTap: () async {
                image = await _pickAnImage(source: ImageSource.gallery);
                if (context.mounted) Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
  return image;
}

Future<XFile?> _pickAnImage({required ImageSource source}) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: source);
  if (image != null) {
    return image;
  }
  return null;
}
