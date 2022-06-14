import 'dart:io';

import 'package:agc_conpany/resources/color_manager.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var checkBox50 = false.obs;
  var checkBox100 = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
  void getImage(ImageSource imageSource) async {
    final pikedFile = await ImagePicker().pickImage(source: imageSource);
    if (pikedFile != null) {
      selectedImagePath.value = pikedFile.path;
      selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2) + "Mb";
    } else {
      Get.snackbar(
        "Error",
        "No Image Selected",
        snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorManager.reject,
        colorText: ColorManager.white
      );
    }
  }
}
