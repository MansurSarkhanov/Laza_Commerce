import 'package:firebase_storage/firebase_storage.dart';

enum FirebaseStorageReferences {
  images;

  Reference get ref => FirebaseStorage.instance.ref();
}
