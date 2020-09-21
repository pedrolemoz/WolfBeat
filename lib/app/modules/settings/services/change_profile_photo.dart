import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/view_model/user/user_view_model.dart';

/// [changeProfilePhotoFromGallery] is a method which have the methods for
/// switch the profile photo.
/// Used in [ProfileSettingsPage].
Future<void> changeProfilePhotoFromGallery(BuildContext context) async {
  // final imagePicker = ImagePicker();

  // TODO: Usar .getImage()

  final image = await ImagePicker.pickImage(source: ImageSource.gallery);

  await _uploadNewPhotoAndUpdate(context, newPhoto: image);
}

Future<void> changeProfilePhotoFromCamera(BuildContext context) async {
  // final imagePicker = ImagePicker();

  final image = await ImagePicker.pickImage(source: ImageSource.camera);

  await _uploadNewPhotoAndUpdate(context, newPhoto: image);
}

Future<void> _uploadNewPhotoAndUpdate(BuildContext context,
    {File newPhoto}) async {
  var storage = FirebaseStorage.instance;
  var userViewModel = GetIt.I.get<UserViewModel>();

  final root = storage.ref();
  final file = root
      .child('users_profile_pictures')
      .child(userViewModel.userID)
      .child('${userViewModel.userID}.jpg');

  var task = file.putFile(newPhoto);

  task.events.listen(
    (storageEvent) {
      if (storageEvent.type == StorageTaskEventType.progress) {
        debugPrint('Fazendo o upload');
      } else if (storageEvent.type == StorageTaskEventType.success) {
        debugPrint('Sucesso o upload');
      }
    },
  );

  await task.onComplete.then(
    (snapshot) async {
      var newImageURI = await snapshot.ref.getDownloadURL();

      // Updating the image locally
      userViewModel.updateImageURI(newImageURI);

      // Updating in Firestore
      var database = Firestore.instance;
      final newImageData = {'imageURI': newImageURI};
      await database
          .collection('users')
          .document(userViewModel.userID)
          .updateData(newImageData);
    },
  );
}
