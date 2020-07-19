import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../model/user_data/user_model.dart';

Future<void> changeProfilePhotoFromGallery(context) async {
  // final imagePicker = ImagePicker();

  // TODO: Usar .getImage()

  File image = await ImagePicker.pickImage(source: ImageSource.gallery);

  _uploadNewPhotoAndUpdate(context, newPhoto: image);
}

Future<void> changeProfilePhotoFromCamera(context) async {
  // final imagePicker = ImagePicker();

  File image = await ImagePicker.pickImage(source: ImageSource.camera);

  _uploadNewPhotoAndUpdate(context, newPhoto: image);
}

Future<void> _uploadNewPhotoAndUpdate(BuildContext context,
    {File newPhoto}) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  UserModel userModel = Provider.of<UserModel>(context, listen: false);

  StorageReference root = storage.ref();
  StorageReference file = root
      .child('images_users')
      .child(userModel.userID)
      .child(userModel.userID + '.jpg');

  StorageUploadTask task = file.putFile(newPhoto);

  task.events.listen(
    (StorageTaskEvent storageEvent) {
      if (storageEvent.type == StorageTaskEventType.progress) {
        print('Fazendo o upload');
      } else if (storageEvent.type == StorageTaskEventType.success) {
        print('Sucesso o upload');
      }
    },
  );

  task.onComplete.then(
    (StorageTaskSnapshot snapshot) async {
      var newImageURI = await snapshot.ref.getDownloadURL();

      // Updating the image locally
      userModel.updateImageURI(newImageURI);

      // Updating in Firestore
      Firestore database = Firestore.instance;
      Map<String, dynamic> newImageData = {'imageURI': newImageURI};
      database
          .collection('users')
          .document(userModel.userID)
          .updateData(newImageData);
    },
  );
}
