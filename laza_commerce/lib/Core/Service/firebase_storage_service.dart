import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laza_commerce/Product/Constants/Paths/image_path.dart';
import 'package:laza_commerce/Product/Utility/Picker/image_pick.dart';

class FirebaseStorageService {
  final firebaseStorageRef = FirebaseStorage.instance.ref();
  final picker = ImagePick();
  XFile? selectedFile;
  Uint8List? selectedImgeByte;
  String imageUrl = ImagePath().emptyImageUrl;

  Future<String?> uploadImage() async {
    print(selectedImgeByte);
    if (selectedImgeByte != null) {
      final uploadImage = await firebaseStorageRef.child('images').child('profile').child(selectedFile!.name).putData(
            selectedImgeByte!,
            SettableMetadata(contentType: 'image/png'),
          );
      imageUrl = await uploadImage.ref.getDownloadURL();
      print(selectedImgeByte);
      print(imageUrl);
      return imageUrl;
  
    }
    return null;
  }

  Future<void> pickImage() async {
    selectedFile = await picker.pickImageGallery();
    selectedImgeByte = await selectedFile?.readAsBytes();
    print(selectedImgeByte);
  }
}
