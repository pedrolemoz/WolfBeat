import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/firebase_helper.dart';
import '../../view_model/user/user_view_model.dart';

/// [changeProfilePhotoFromGallery] is a method which have the methods for
/// switch the profile photo.
/// Used in [ProfileSettingsPage].
Future<void> changeProfilePhotoFromGallery(BuildContext context) async {
  // ignore: deprecated_member_use
  final _image = await ImagePicker.pickImage(source: ImageSource.gallery);

  await _uploadNewPhotoAndUpdate(context, newPhoto: _image);
}

Future<void> changeProfilePhotoFromCamera(BuildContext context) async {
  // ignore: deprecated_member_use
  final _image = await ImagePicker.pickImage(source: ImageSource.camera);

  await _uploadNewPhotoAndUpdate(context, newPhoto: _image);
}

Future<void> _uploadNewPhotoAndUpdate(BuildContext context,
    {File newPhoto}) async {
  var _storage = FirebaseStorage.instance;
  var _userViewModel = GetIt.I.get<UserViewModel>();

  final _root = _storage.ref();
  final _file = _root
      .child(FirebaseHelper.usersProfilePicturesFolder)
      .child(_userViewModel.userID)
      .child('${_userViewModel.userID}.jpg');

  var _task = _file.putFile(newPhoto);

  _task.events.listen(
    (storageEvent) {
      if (storageEvent.type == StorageTaskEventType.progress) {
        debugPrint('Fazendo o upload');
      } else if (storageEvent.type == StorageTaskEventType.success) {
        debugPrint('Sucesso no upload');
      }
    },
  );

  await _task.onComplete.then(
    (snapshot) async {
      var _newImageURI = await snapshot.ref.getDownloadURL();

      // Updating the image locally
      _userViewModel.updateImageURI(_newImageURI);

      // Updating in Firestore
      var _database = Firestore.instance;
      final _newImageData = {FirebaseHelper.imageURIAttribute: _newImageURI};
      await _database
          .collection(FirebaseHelper.usersCollection)
          .document(_userViewModel.userID)
          .updateData(_newImageData);
    },
  );
}
