class FirebaseHelper {
  // Collection related
  static String get usersCollection => 'users';
  static String get songsCollection => 'songs';

  // User related
  static String get nameAttribute => 'name';
  static String get emailAttribute => 'email';
  static String get typeAttribute => 'type';
  static String get imageURIAttribute => 'imageURI';
  static String get uuidAttribute => 'uuid';
  static String get favoriteSongsAttribute => 'favoriteSongs';

  // Song related
  static String get titleAttribute => 'title';
  static String get artistAttribute => 'artist';
  static String get albumAttribute => 'album';
  static String get artworkURLAttribute => 'artworkURL';
  static String get durationAttribute => 'duration';
  static String get genreAttribute => 'genre';
  static String get songURLAttribute => 'songURL';
  static String get referenceAttribute => 'reference';
  static String get backgroundColorAttribute => 'backgroundColor';

  // Storage related
  static String get usersProfilePicturesFolder => 'users_profile_pictures';
}
