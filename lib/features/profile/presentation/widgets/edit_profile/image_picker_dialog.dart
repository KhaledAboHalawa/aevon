import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> showImagePickerDialog(BuildContext context) async {
  XFile? image;
  await showDialog<XFile>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Select Image"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () async {
                image = await _pickAnImage(source: ImageSource.camera);
                if (context.mounted) Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
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
