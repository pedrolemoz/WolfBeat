import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../user/user_controller.dart';

Future<void> changeProfilePhotoFromGallery(BuildContext context) async {
  // final imagePicker = ImagePicker();

  // TODO: Usar .getImage()

  final image = await ImagePicker.pickImage(source: ImageSource.gallery);

  _uploadNewPhotoAndUpdate(context, newPhoto: image);
}

Future<void> changeProfilePhotoFromCamera(BuildContext context) async {
  // final imagePicker = ImagePicker();

  final image = await ImagePicker.pickImage(source: ImageSource.camera);

  _uploadNewPhotoAndUpdate(context, newPhoto: image);
}

Future<void> _uploadNewPhotoAndUpdate(BuildContext context,
    {File newPhoto}) async {
  var storage = FirebaseStorage.instance;
  var userController = Provider.of<UserController>(context, listen: false);

  final root = storage.ref();
  final file = root
      .child('users_profile_pictures')
      .child(userController.userID)
      .child('${userController.userID}.jpg');

  var task = file.putFile(newPhoto);

  task.events.listen(
    (storageEvent) {
      if (storageEvent.type == StorageTaskEventType.progress) {
        print('Fazendo o upload');
      } else if (storageEvent.type == StorageTaskEventType.success) {
        print('Sucesso o upload');
      }
    },
  );

  task.onComplete.then(
    (snapshot) async {
      var newImageURI = await snapshot.ref.getDownloadURL();

      // Updating the image locally
      userController.updateImageURI(newImageURI);

      // Updating in Firestore
      var database = Firestore.instance;
      final newImageData = {'imageURI': newImageURI};
      database
          .collection('users')
          .document(userController.userID)
          .updateData(newImageData);
    },
  );
}
