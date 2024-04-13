import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

Future<String?> cropImage({
  required BuildContext context,
  required String pathImage,
  required String title,
  ImageCompressFormat? compressFormat,
  int? compressQuality,
  List<CropAspectRatioPreset>? aspectRatioPresets,
}) async {
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: pathImage,
    compressFormat: compressFormat ?? ImageCompressFormat.jpg,
    compressQuality: compressQuality ?? 100,
    aspectRatioPresets: aspectRatioPresets ??
        [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: title,
          toolbarColor: Theme.of(context).primaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: title,
      ),
    ],
  );
  if (croppedFile != null) {
    return croppedFile.path;
  }
  return null;
}
