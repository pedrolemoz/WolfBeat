import 'package:flutter/foundation.dart';

class User {
  User({
    @required this.password,
    @required this.email,
    this.name,
    this.imageURI,
  });

  String name;
  String password;
  String email;
  String imageURI;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'type': 'Email',
      'imageURI': imageURI
    };

    return map;
  }

  Map<String, dynamic> toMapGoogle() {
    Map<String, dynamic> mapGoogle = {
      'name': name,
      'email': email,
      'type': 'Google',
      'imageURI': imageURI
    };

    return mapGoogle;
  }

  Map<String, dynamic> toMapFacebook() {
    Map<String, dynamic> mapFacebook = {
      'name': name,
      'email': email,
      'type': 'Facebook',
      'imageURI': imageURI
    };

    return mapFacebook;
  }
}
