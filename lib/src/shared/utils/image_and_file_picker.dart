import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

Future<File?> imagePicker(
    {ImageSource imageSource = ImageSource.gallery}) async {
  try {
    XFile? image = await picker.pickImage(source: imageSource);

    if (image != null) {
      return File(image.path);
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

Future<List<File>?> imageMultiplePicker() async {
  try {
    List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      List<File> files = images.map((e) => File(e.path)).toList();

      return files;
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

Future<File?> filePicker() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  try {
    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

Future<List<File>?> fileMultiplePicker() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(allowMultiple: true);

  try {
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

Future<List<File>?> fileWithSpecificExtensionPicker({
  List<String> allowedExtensions = const ['jpg', 'pdf', 'png', 'jpeg'],
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: false,
    allowedExtensions: allowedExtensions,
  );

  try {
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}

Future<List<File>?> fileMultipleWithSpecificExtensionPicker({
  List<String> allowedExtensions = const ['jpg', 'pdf', 'png', 'jpeg'],
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: true,
    allowedExtensions: allowedExtensions,
  );

  try {
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      // User canceled the picker
      return null;
    }
  } catch (e) {
    throw e.toString();
  }
}
