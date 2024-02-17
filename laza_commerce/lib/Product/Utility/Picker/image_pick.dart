import 'package:image_picker/image_picker.dart';

class ImagePick {
  final _picker = ImagePicker();
  Future<XFile?> pickImageGallery() async {
    final pickImage = await _picker.pickImage(source: ImageSource.gallery);
    return pickImage;
  }

}
