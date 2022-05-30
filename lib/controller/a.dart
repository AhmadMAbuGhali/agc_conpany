import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AuthProvider extends ChangeNotifier{
  AuthProvider();



  File? file;

  pickNewImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file!.path);
    notifyListeners();
  }


}
