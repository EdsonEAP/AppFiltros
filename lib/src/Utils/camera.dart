import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class OpenCamera {
  static List<File> file = [];

  static Future<File?> getImage({
    required ImageSource source,
  }) async {
    ImagePicker imagePicker = ImagePicker();

    XFile? pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      File? imageFile = File(pickedFile.path);
      return imageFile;
    }
    return null;
  }
}
