import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePick {
  Future<File?> pickImageGallery() async {
    final pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      final imageFile = File(pickImage.path);
      return imageFile;
    }
    return null;
  }
}
