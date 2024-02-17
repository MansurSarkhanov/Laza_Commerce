import 'dart:io';

import 'package:laza_commerce/Product/Utility/Firebase/firebase_storage_references.dart';
import 'package:laza_commerce/Product/Utility/Picker/image_pick.dart';

class FirebaseStorageService {
  final firebaseStorageRef = FirebaseStorageReferences.images.ref;
  final selectImage = ImagePick();

  Future<void> uploadImage() async {
    final setImage = await firebaseStorageRef.putFile(File(selectImage.pickImageGallery().toString()));

    print(setImage);
  }
}
