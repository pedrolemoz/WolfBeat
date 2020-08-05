/// [User] is a class that represents the user object.
/// It's the atributes of a user.
/// Used in [loginUserWithEmailAndPassword], [signUpUserWithEmailAndPassword], [authWithGoogle].
class User {
  User({
    this.password,
    this.email,
    this.name,
    this.imageURI,
    this.uuid,
  });

  String name;
  String password;
  String email;
  String imageURI;
  String uuid;

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'name': name,
      'email': email,
      'type': 'Email',
      'imageURI': imageURI,
      'uuid': uuid,
    };

    return map;
  }

  Map<String, dynamic> toMapGoogle() {
    final mapGoogle = {
      'name': name,
      'email': email,
      'type': 'Google',
      'imageURI': imageURI,
      'uuid': uuid,
    };

    return mapGoogle;
  }

  Map<String, dynamic> toMapFacebook() {
    final mapFacebook = {
      'name': name,
      'email': email,
      'type': 'Facebook',
      'imageURI': imageURI,
      'uuid': uuid,
    };

    return mapFacebook;
  }
}
