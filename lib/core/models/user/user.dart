import 'package:flutter/foundation.dart';

import '../../exceptions/null_attribute_exception.dart';
import '../../helpers/firebase_helper.dart';

/// [User] is a class that represents the user object.
/// Used in [loginUserWithEmailAndPassword], [signUpUserWithEmailAndPassword]
/// and in [authWithGoogle].
class User {
  /// These are the user attributes. [email] is the only required attribute, since
  /// [signInWithCredential] method in [GoogleSignIn] does not require a password.
  User({
    this.password,
    @required this.email,
    this.name,
    this.imageURI,
    this.uuid,
  }) : assert(email != null, throw NullAttributeException('email'));

  String name;
  String password;
  String email;
  String imageURI;
  String uuid;

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      FirebaseHelper.nameAttribute: name,
      FirebaseHelper.emailAttribute: email,
      FirebaseHelper.favoriteSongsAttribute: [],
      FirebaseHelper.playlistsAttribute: [],
      FirebaseHelper.typeAttribute: 'Email',
      FirebaseHelper.imageURIAttribute: imageURI,
      FirebaseHelper.uuidAttribute: uuid,
    };

    return map;
  }

  Map<String, dynamic> toMapGoogle() {
    final mapGoogle = {
      FirebaseHelper.nameAttribute: name,
      FirebaseHelper.emailAttribute: email,
      FirebaseHelper.favoriteSongsAttribute: [],
      FirebaseHelper.playlistsAttribute: [],
      FirebaseHelper.typeAttribute: 'Google',
      FirebaseHelper.imageURIAttribute: imageURI,
      FirebaseHelper.uuidAttribute: uuid,
    };

    return mapGoogle;
  }

  Map<String, dynamic> toMapFacebook() {
    final mapFacebook = {
      FirebaseHelper.nameAttribute: name,
      FirebaseHelper.emailAttribute: email,
      FirebaseHelper.favoriteSongsAttribute: [],
      FirebaseHelper.playlistsAttribute: [],
      FirebaseHelper.typeAttribute: 'Facebook',
      FirebaseHelper.imageURIAttribute: imageURI,
      FirebaseHelper.uuidAttribute: uuid,
    };

    return mapFacebook;
  }
}
