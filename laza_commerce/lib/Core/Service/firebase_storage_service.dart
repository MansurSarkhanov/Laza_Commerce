import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laza_commerce/Product/Utility/Picker/image_pick.dart';

class FirebaseStorageService {
  final firebaseStorageRef = FirebaseStorage.instance.ref();
  final picker = ImagePick();
  XFile? selectedFile;
  Uint8List? selectedImgeByte;

  Future<void> uploadImage() async {
    if (selectedImgeByte != null) {
      final resultImage = await firebaseStorageRef
          .child(selectedFile!.name)
          .putData(selectedImgeByte!, SettableMetadata(contentType: 'image/png'));

      print(selectedImgeByte);
    }
  }

  Future<void> pickImage() async {
    selectedFile = await picker.pickImageGallery();
    selectedImgeByte = await selectedFile?.readAsBytes();
    print(selectedImgeByte);
  }
}
