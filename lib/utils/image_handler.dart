import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHandler {
  File? _image;

  Future<void> pickAndcropImage({required ImageSource source}) async {
    final image = await ImagePicker().pickImage(source: source);
    try {
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      _image = img;
    } catch (e) {}
  }

  Future<File?> _cropImage({required File imageFile})async{
    CroppedFile? croppedFile = await ImageCropper().cropImage(sourcePath: imageFile.path);
    if(croppedFile == null) return null;
    return File(croppedFile.path);

  }

  File? get getImage => _image;
}
